package Pod::WikiDoc;
use strict;
use warnings;
use vars qw($VERSION );
$VERSION     = "0.10";

use 5.006;
use Carp;
use IO::String;
use Scalar::Util qw( blessed );
use Pod::WikiDoc::Parser;

#--------------------------------------------------------------------------#
# PREAMBLE DOCUMENTATION
#--------------------------------------------------------------------------#

=begin wikidoc

= NAME

Pod::WikiDoc - Generate Pod from inline wiki style text 

= SYNOPSIS

In a source file, Pod format-block style:
    =begin wikidoc

    = POD FORMAT-BLOCK STYLE
    
    Write documentation with *bold*, ~italic~ or {code}
    markup.  Create a link to [Pod::WikiDoc].

        Indent for verbatim paragraphs

    * bullet
    * point
    * list

    0 sequentially
    0 numbered
    0 list

    = end wikidoc
    
In a source file, wikidoc-comment style:
    ### = WIKIDOC-COMMENT STYLE
    ###
    ### Optionally, [Pod::WikiDoc] can extract from
    ### specially-marked comment blocks

Generate Pod from wikidoc, programmatically:
    use Pod::WikiDoc;
    my $parser = Pod::WikiDoc->new( { comment_doc => 1 } );
    $parser->filter( 
        { input => "my_module.pm", output => "my_module.pod" }
    );

Generate Pod from wikidoc, via command line:
    $ wikidoc -c my_module.pm my_module.pod
    
= DESCRIPTION

Pod works well, but writing it can be time consuming or tedious.  For example,
commonly used structures like lists require numerous lines of text to make just
a couple of simple points.  An alternative approach is to write documentation
in a wiki-text shorthand (referred to here as ~wikidoc~) and use Pod::WikiDoc
to extract it and convert it into its corresponding Pod as a separate {.pod}
file.

Documentation written in wikidoc may be embedded in Pod format-blocks, or,
optionally, in specially marked comment blocks.  Wikidoc uses simple text-based
markup like wiki websites to indicate formatting and links.  (See 
[/WIKIDOC MARKUP], below.)

Pod::WikiDoc processes text files (or text strings) by extracting both
existing Pod and wikidoc, converting the wikidoc to Pod, and then writing
the combined document back to a file or standard output. 

Summary of major features of Pod::WikiDoc:

* Extracts and converts wikidoc from Pod format blocks or special 
wikidoc comment blocks
* Extracts and preserves existing Pod
* Provides bold, italic, code, and link markup
* Automatically converts special symbols in wikidoc to their
Pod escape equivalents, e.g. {E<lt>}, {E<gt>}
* Preserves other Pod escape sequences, e.g. {E<euro>}

In addition, Pod::WikiDoc provides a command-line utility, [wikidoc],
to provide easy automation of wikidoc translation.

See the [Pod::WikiDoc::Cookbook] for more detailed usage examples.

= INTERFACE

=end wikidoc

=cut

#--------------------------------------------------------------------------#
# PUBLIC METHODS
#--------------------------------------------------------------------------#

### == {new}
### 
###     $parser = Pod::WikiDoc->new( \%args );
### 
### Constructor for a new Pod::WikiDoc object.  It takes a single, optional 
### argument, a hash reference with the following optional keys:
###
### * ~comment_doc~: if true, Pod::WikiDoc will scan for wikidoc in comment
### blocks.  Default is false.
### * ~comment_doc_length~: the number of leading sharp symbols to denote a
### comment block.  Default is 3.

my @valid_args = qw( comment_doc comment_doc_length );

sub new {
    my ( $class, $args ) = @_;

    croak "Error: Class method new() can't be called on an object"
        if ref $class;

    croak "Error: Argument to new() must be a hash reference"
        if $args && ref $args ne 'HASH';
        
    my $self = {
        comment_doc         => 0,
        comment_doc_length  => 3,
    };

    # pick up any specified arguments;
    for my $key ( @valid_args ) {
        if ( exists $args->{$key} ) {
            $self->{$key} = $args->{$key};
        }
    }

    # load up a parser 
    $self->{parser} = Pod::WikiDoc::Parser->new();
    
    return bless $self, $class;
}

### == {convert}
### 
###     my $pod_text = $parser->convert( $input_text );
### 
### Given a string with valid Pod and/or wikidoc markup, filter/translate it to
### Pod.  This is really just a wrapper around {filter} for working with
### strings rather than files.

sub convert {
    my ($self, $input_string) = @_;

    croak "Error: Argument to convert() must be a scalar"
        if ( ref \$input_string ne 'SCALAR' );
        
    my $input_fh = IO::String->new( $input_string );
    my $output_fh = IO::String->new();
    _filter_podfile( $self, $input_fh, $output_fh );
    
    return ${ $output_fh->string_ref() };
}

### == {filter}
### 
###     $parser->filter( \%args );
### 
### {filter} takes a single, optional argument, a hash reference with 
### the following optional keys:
###
### * ~input~: a filename or filehandle to read from. Defaults to STDIN.  
### * ~output~: a filename or filehandle to write to.  If given a filename,
### an existing file will be clobbered. Defaults to STDOUT.
###
### Filters from the input file for Pod and wikidoc, translating it to Pod 
### and writing it to the output file.

sub filter {
    my ( $self, $args_ref ) = @_;
    
    croak "Error: Argument to filter() must be a hash reference"
        if defined $args_ref && ref($args_ref) ne 'HASH';
    # setup input
    my $input_fh;
    if ( ! $args_ref->{input} ) {
        $input_fh = \*STDIN;
    }
    elsif ( ( blessed $args_ref->{input} && $args_ref->{input}->isa('GLOB') )
         || ( ref $args_ref->{input}  eq 'GLOB' ) 
         || ( ref \$args_ref->{input} eq 'GLOB' ) ) {
        # filehandle or equivalent
        $input_fh = $args_ref->{input};
    } 
    elsif ( ref \$args_ref->{input} eq 'SCALAR' ) {
        # filename
        open( $input_fh, "<", $args_ref->{input} )
            or croak "Error: Couldn't open input file '$args_ref->{input}': $!";
    }
    else {
        croak "Error: Invalid variable type for input file argument to filter()";
    }
    
    # setup output
    my $output_fh;
    if ( ! $args_ref->{output} ) {
        $output_fh = \*STDOUT;
    }
    elsif ( ( blessed $args_ref->{output} && $args_ref->{output}->isa('GLOB') )
         || ( ref $args_ref->{output}  eq 'GLOB' ) 
         || ( ref \$args_ref->{output} eq 'GLOB' ) ) {
        # filehandle or equivalent
        $output_fh = $args_ref->{output};
    } 
    elsif ( ref \$args_ref->{output} eq 'SCALAR' ) {
        # filename
        open( $output_fh, ">", $args_ref->{output} )
            or croak "Error: Couldn't open output file '$args_ref->{output}': $!";
    }
    else {
        croak "Error: Invalid variable type for output file argument to filter()";
    }
    
    _filter_podfile( $self, $input_fh, $output_fh );
    return;
}

sub format {
    my ($self, $wikitext) = @_;
    
    croak "Error: Argument to format() must be a scalar"
        if ( ref \$wikitext ne 'SCALAR' );
        
    my $wiki_tree  = $self->{parser}->WikiDoc( $wikitext ) ;
    for my $node ( @$wiki_tree ) {
        undef $node if ! ref $node;
    }

    return _wiki2pod( $wiki_tree );
}

#--------------------------------------------------------------------------#
# PRIVATE METHODS
#--------------------------------------------------------------------------#

#--------------------------------------------------------------------------#
# _comment_doc_regex
#
# construct a regex dynamically for the right comment prefix
#--------------------------------------------------------------------------#

sub _comment_doc_regex {
    my ( $self ) = @_;
    my $length = $self->{comment_doc_length};
    return "\\A#{$length} (.*)?\\z";
}

#--------------------------------------------------------------------------#
# _filter_podfile() 
#
# extract Pod from input and pass through to output, converting any wikidoc
# markup to Pod in the process
#--------------------------------------------------------------------------#

sub _filter_podfile {
    my ($self, $input_fh, $output_fh) = @_;

    # initialize flags and buffers
    my $in_pod      = 0; # not in a Pod section at start
    my $in_begin    = 0; # not in a begin section 
    my $in_wikidoc  = 0; # not in a wikidoc section
    my $in_comment_doc = 0; # not in a wikidoc comment section
    my @wikidoc;
    
    # init regex
    my $comment_regex = _comment_doc_regex($self);
    my $MATCHES_COMMENT_DOC = qr{$comment_regex}ms;
    
    # open output with tag and Pod marker
    print $output_fh
          "# Generated by Pod::WikiDoc version $VERSION on "
        , scalar localtime
        , "\n\n";
    print $output_fh "=pod\n\n";
    
    # process line-by-line
    my $line;
    LINE:
    while ( defined( $line = <$input_fh> ) ) {
        if ( $in_pod && ( ! $in_wikidoc) ) {
            if ( $line =~ m{ \A =cut }xms ) {
                $in_pod = 0;
                next LINE;
            }
            elsif ( $line =~ m{ \A =(begin|for) \s+ wikidoc \s* (.*)}xms ) {
                my ($command, $para) = ($1, $2);
                
                $in_wikidoc = 1;
                $in_begin = $command eq 'begin' ? 1 : 0;
                
                # if =for wikidoc, then store $para
                if ( ! $in_begin && defined $para && length $para ) {
                    push @wikidoc, $para;
                }
                next LINE;
            }
            else {
                print $output_fh $line;
            }
        }
        elsif ( $in_pod && $in_wikidoc ) {
            # see if we're done -- =begin/=end or =for/blankline
            if (    (   $in_begin && $line =~ m{\A =end \s+ wikidoc}xms )
                 || ( ! $in_begin && $line =~ m{\A \s*  \z         }xms ) ) {
                
                print $output_fh _translate_wikidoc( $self, \@wikidoc );
                @wikidoc = ();
                $in_wikidoc = $in_begin = 0;
                next LINE;
            }
            # not done, so store up the wikidoc
            push @wikidoc, $line;
            next LINE;
        }
        elsif ( ( ! $in_pod ) && $in_comment_doc ) {
            # capture a comment_doc line
            if ( $line =~ $MATCHES_COMMENT_DOC ) {
                my $comment_doc_text = defined $1 ? $1 : q{};
                push @wikidoc, $comment_doc_text; 
                next LINE;
            }
            else { 
                print $output_fh _translate_wikidoc( $self, \@wikidoc );
                @wikidoc = ();
                $in_comment_doc = 0;
                redo LINE;
            }
        }
        else {
            # if it's a Pod command, flag and handle it
            if ( $line =~ m{ \A = ([a-zA-Z]\S*) }xms ) {
                my $command = $1;
                
                # =cut can't start pod
                if ( $command eq "cut" ) {
                    next LINE;
                }

                # flag that we've found Pod
                $in_pod = 1;

                # eat a =pod marker, otherwise, process it as Pod
                if ( $command eq "pod" ) {
                    next LINE;
                }
                else {
                    redo LINE;
                }
            }
            # if it's a doc comment and we're using them, flag and restart
            elsif ( $self->{comment_doc} && $line =~ $MATCHES_COMMENT_DOC ) {
                $in_comment_doc = 1;
                redo LINE;
            }
            # otherwise, move on
            else {
                next LINE;
            }
        }
    } # while
    
    # print any unfinished wikidoc capture
    if ( @wikidoc ) {
        print $output_fh _translate_wikidoc( $self, \@wikidoc );
    }

    return;
}

#--------------------------------------------------------------------------#
# Translation functions and tables
#--------------------------------------------------------------------------#

#--------------------------------------------------------------------------#
# Tables for formatting
#--------------------------------------------------------------------------#

# Used in closure for counting numbered lists
my $numbered_bullet;

# Text to print at start of entity from parse tree, or a subroutine
# to generate the text programmatically
my %opening_of = (
    Paragraph           =>  q{},
    Unordered_List      =>  "=over\n\n",
    Ordered_List        =>  sub { $numbered_bullet = 1; return "=over\n\n" },
    Preformat           =>  q{},
    Header              =>  sub { 
                                my $node = shift; 
                                my $level = $node->{level} > 4 
                                    ? 4 : $node->{level};
                                return "=head$level "
                            },
    Bullet_Item         =>  "=item *\n\n",
    Numbered_Item       =>  sub { 
                                return  "=item " . $numbered_bullet++ 
                                        . ".\n\n" 
                            },
    Indented_Line       =>  q{ },
    Plain_Line          =>  q{},
    Empty_Line          =>  q{ },
    RegularText         =>  q{},
    EscapedChar         =>  q{},
    WhiteSpace          =>  q{},
    InlineCode          =>  "C<<< ",
    BoldText            =>  'B<',
    ItalicText          =>  'I<',
    LinkContent         =>  'L<',
    LinkLabel           =>  q{},
    LinkTarget          =>  q{},
);

# Text to print at end of entity from parse tree, or a subroutine
# to generate the text programmatically
my %closing_of = (
    Paragraph           =>  "\n",
    Unordered_List      =>  "=back\n\n",
    Ordered_List        =>  "=back\n\n",
    Preformat           =>  "\n",
    Header              =>  "\n\n",
    Bullet_Item         =>  "\n\n",
    Numbered_Item       =>  "\n\n",
    Indented_Line       =>  "\n",
    Plain_Line          =>  "\n",
    Empty_Line          =>  "\n",
    RegularText         =>  q{},
    EscapedChar         =>  q{},
    WhiteSpace          =>  q{},
    InlineCode          =>  " >>>",
    BoldText            =>  ">",
    ItalicText          =>  ">",
    LinkContent         =>  ">",
    LinkLabel           =>  "|",
    LinkTarget          =>  q{},
);

# Subroutine to handle actual raw content from different node types
# from the parse tree
my %content_handler_for = (
    RegularText         =>  \&_escape_pod, 
    Empty_Line          =>  sub { q{} },
);

# Table of character to E<> code conversion
my %escape_code_for = (
    ">" =>  "E<gt>",
    "<" =>  "E<lt>",
    "|" =>  "E<verbar>",
    "/" =>  "E<sol>",
);

# List of characters that need conversion
my $specials = join q{}, keys %escape_code_for;

#--------------------------------------------------------------------------#
# _escape_pod()
#
# After removing backslash escapes from a text string, translates characters
# that must be escaped in Pod <, >, |, and / to their Pod E<> code equivalents
#
#--------------------------------------------------------------------------#

sub _escape_pod { 
    
    my $node = shift; 
    
    my $input_text  = $node->{content};
    
    # remove backslash escaping
    $input_text =~ s{ \\(.) } 
                    {$1}gxms;
    
    # replace special symbols with corresponding escape code
    $input_text =~ s{ ( [$specials] ) } 
                    {$escape_code_for{$1}}gxms; 

    return $input_text; 
}

#--------------------------------------------------------------------------#
# _translate_wikidoc()
#
# given an array of wikidoc lines, joins them and runs them through
# the formatter
#--------------------------------------------------------------------------#

sub _translate_wikidoc {
    my ( $self, $wikidoc_ref ) = @_;
    return $self->format( join q{}, @$wikidoc_ref );
}

#--------------------------------------------------------------------------#
# _wiki2pod()
#
# recursive function that walks a Pod::WikiDoc::Parser tree and generates
# a string with the corresponding Pod
#--------------------------------------------------------------------------#

sub _wiki2pod {
    my ($nodelist, $insert_space) = @_;
    my $result = q{};
    for my $node ( @$nodelist ) {
        # XXX print "$node\n" if ref $node ne 'HASH';
        my $opening = $opening_of{ $node->{type} };
        my $closing = $closing_of{ $node->{type} };

        $result .= ref $opening eq 'CODE' ? $opening->($node) : $opening;
        if ( ref $node->{content} eq 'ARRAY' ) {
            $result .= _wiki2pod( 
                $node->{content}, 
                $node->{type} eq 'Preformat' ? 1 : 0 
            );
        }
        else {
            my $handler = $content_handler_for{ $node->{type} };
            $result .= defined $handler 
                     ? $handler->( $node ) : $node->{content}
            ;
        }
        $result .= ref $closing eq 'CODE' ? $closing->($node) : $closing;
    }
    return $result;
}

1; #this line is important and will help the module return a true value
__END__

=begin wikidoc

= WIKIDOC MARKUP

Wikidoc is composed of both block and inline markup.

Block markup:

    = header level 1
    
    == header level 2

Inline markup:

    *bold*

    ~italic~

    [link]

    {monospace a.k.a. code}

    \*escapes

    E<euro> (regular Pod E<> markup for special symbols is passed through)

= DIAGNOSTICS

* ~Error: Argument to convert() must be a scalar~
* ~Error: Argument to filter() must be a hash reference~
* ~Error: Argument to format() must be a scalar~
* ~Error: Argument to new() must be a hash reference~
* ~Error: Class method new() can't be called on an object~
* ~Error: Couldn't open input file 'FILENAME'~
* ~Error: Couldn't open output file 'FILENAME'~
* ~Error: Invalid variable type for input file argument to filter()~
* ~Error: Invalid variable type for output file argument to filter()~
    
= CONFIGURATION AND ENVIRONMENT

No configuration files or environment variables are used.

= DEPENDENCIES

Pod::WikiDoc depends on the following modules:
* [Getopt::Std]
* [IO::String]
* [Parse::RecDescent]
* [Scalar::Util]

= INCOMPATIBILITIES

Use of the wikidoc comment-blocks conflicts with [Smart::Comments].
Change the {comment_prefix} argument to {new} in Pod::WikiDoc or the level
of 'smartness' in [Smart::Comments] to avoid the conflict.

= BUGS

Please report bugs using the CPAN Request Tracker at 
[http://rt.cpan.org/NoAuth/Bugs.html?Dist=Pod-WikiDoc]

= AUTHOR

David A Golden (DAGOLDEN)

dagolden@cpan.org

[http://dagolden.com/]

= COPYRIGHT

Copyright (c) 2005 by David A Golden

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=end wikidoc

