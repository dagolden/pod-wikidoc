package Pod::WikiDoc;
use strict;
use warnings;
use vars qw($VERSION );
$VERSION     = "0.11";

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
    
In a source file, wikidoc comment-block style:
    ### = WIKIDOC COMMENT-BLOCK STYLE
    ###
    ### Optionally, [Pod::WikiDoc] can extract from
    ### specially-marked comment blocks

Generate Pod from wikidoc, programmatically:
    use Pod::WikiDoc;
    my $parser = Pod::WikiDoc->new( { comment_blocks => 1 } );
    $parser->filter( 
        { input => "my_module.pm", output => "my_module.pod" }
    );

Generate Pod from wikidoc, via command line:
    $ wikidoc -c my_module.pm my_module.pod
    
= DESCRIPTION

Pod works well, but writing it can be time-consuming and tedious.  For example,
commonly used layouts like lists require numerous lines of text to make just
a couple of simple points.  An alternative approach is to write documentation
in a wiki-text shorthand (referred to here as ~wikidoc~) and use Pod::WikiDoc
to extract it and convert it into its corresponding Pod as a separate {.pod}
file.

Documentation written in wikidoc may be embedded in Pod format blocks, or,
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
Pod escape equivalents, e.g. \E\<lt\>, \E\<gt\>
* Preserves other Pod escape sequences, e.g. \E\<euro\>

In addition, Pod::WikiDoc provides a command-line utility, [wikidoc],
to simplify wikidoc translation.

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
### argument: a hash reference with the following optional keys:
###
### * {comment_blocks}: if true, Pod::WikiDoc will scan for wikidoc in comment
### blocks.  Default is false.
### * {comment_prefix_length}: the number of leading sharp (#) symbols to 
### denote a comment block.  Default is 3.

my %default_args = (
    comment_blocks         => 0,
    comment_prefix_length  => 3,
);

sub new {
    my ( $class, $args ) = @_;

    croak "Error: Class method new() can't be called on an object"
        if ref $class;

    croak "Error: Argument to new() must be a hash reference"
        if $args && ref $args ne 'HASH';
        
    my $self = { %default_args };

    # pick up any specified arguments;
    for my $key ( keys %default_args ) {
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
### strings rather than files, and provides similar behavior, including adding
### a 'Generated by' header.

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
### Filters from an input file for Pod and wikidoc, translating it to Pod 
### and writing it to an output file.  The output file will be prefixed with
### a 'Generated by' comment with the version of Pod::WikiDoc and timestamp,
### as required by [perlpodspec].
###
### {filter} takes a single, optional argument: a hash reference with 
### the following optional keys:
###
### * {input}: a filename or filehandle to read from. Defaults to STDIN.  
### * {output}: a filename or filehandle to write to.  If given a filename
### and the file already exists, it will be clobbered. Defaults to STDOUT.

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
        croak "Error: 'input' parameter for filter() must be a filename or filehandle"
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
        croak "Error: 'output' parameter for filter() must be a filename or filehandle"
    }
    
    _filter_podfile( $self, $input_fh, $output_fh );
    return;
}

### == {format}
###
###     my $pod_text = $parser->format( $wiki_text );
### 
### Given a string with valid Pod and/or wikidoc markup, filter/translate it to
### Pod. Unlike {convert}, no 'Generated by' comment is added.

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
# _comment_block_regex
#
# construct a regex dynamically for the right comment prefix
#--------------------------------------------------------------------------#

sub _comment_block_regex {
    my ( $self ) = @_;
    my $length = $self->{comment_prefix_length};
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
    my $in_comment_block = 0; # not in a wikidoc comment section
    my @wikidoc;
    
    # init regex
    my $comment_regex = _comment_block_regex($self);
    my $MATCHES_COMMENT_BLOCK = qr{$comment_regex}ms;
    
    # open output with tag and Pod marker
    print $output_fh
          "# Generated by Pod::WikiDoc version $VERSION\n\n";
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
        elsif ( ( ! $in_pod ) && $in_comment_block ) {
            # capture a comment_block line
            if ( $line =~ $MATCHES_COMMENT_BLOCK ) {
                my $comment_block_text = defined $1 ? $1 : q{};
                push @wikidoc, $comment_block_text; 
                next LINE;
            }
            else { 
                print $output_fh _translate_wikidoc( $self, \@wikidoc );
                @wikidoc = ();
                $in_comment_block = 0;
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
            # if it's a comment block and we're using them, flag and restart
            elsif ( $self->{comment_blocks} && $line =~ $MATCHES_COMMENT_BLOCK ) {
                $in_comment_block = 1;
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

Pod::WikiDoc uses a wiki-style text markup, called wikidoc.  It is heavily
influenced by [Kwiki].  Like other wiki markup, it has both block and 
inline elements, which map directly to their Pod equivalents.

Block elements include:
* Headers
* Verbatim text
* Bullet lists
* Numbered lists
* Ordinary paragraphs

Inline elements include:
* Bold markup
* Italic markup
* Code markup
* Link markup
* Escape code markup

All text except that found in verbatim text or code markup is transformed to
convert Pod special elements to Pod escape code markup: \E\<lt\>, \E\<gt\>,
\E\<sol\>, \E\<verbar\>.  Inline markup can be escaped with a backslash.
Including a literal backslash requires a double-backslash.

== Headers

Headers are indicated with one or more equals signs followed by whitespace in
the first column.  The number of equals signs indicates the level of the
header (the maximum is four).  Headers can not span multiple lines.  

    = header level 1
    
    == header level 2

== Verbatim text

Verbatim text is indicated with leading whitespace in each line of text,
just as with Pod.

    #<--- first column 

        sub verbatim {}

== Bullet lists

Bullet lists are indicated with an asterisk in the first column followed by
whitespace.  Bullet lists can span multiple lines.  Lines after the first
should not have an asterisk or be indented.

    * First item in the list
    * Second item in the list
    on multiple lines
    * Third item in the list

== Numbered lists

Numbered lists work just like numbered lists, but with a leading 0 followed
by whitespace.

    0 First item in the list
    0 Second item in the list
    on multiple lines
    0 Third item in the list

== Ordinary paragraphs

Ordinary paragraphs consist of one or more lines of text that do not match
the criteria of other blocks.  Paragraphs are terminated with a empty line.

    This is an ordinary paragraph that
    spans multiple lines.

== Bold markup

Bold text is indicated by bracketing with asterisks.  Bold markup must
begin at a whitespace boundary, the start of a line, or the inside of
other markup.

    This shows *bold* text.

== Italic markup

Italic text is indicated by bracketing with tildes.  Italic markup must
begin at a whitespace boundary, the start of a line, or the inside of
other markup.

    This shows ~italic~ text.

== Code markup

Code (monospaced) text is indicated by bracketing with matched braces.  Code
markup must begin at a whitespace boundary, the start of a line, or the inside
of other markup.  Brackets should nest properly with code.

    This shows {code} text.  It can surround text
    with brackets like this: { $data{ $id } }

== Link markup

Link text is indicated by bracketing with square brackets.  As with Pod, link
text may include a vertical bar to separate display text from the link itself.
Link markup must begin at a whitespace boundary, the start of a line, or the
inside of other markup.

    This is an ordinary [Pod::WikiDoc] link.
    This is a [way to ~markup~ links|Pod::WikiDoc] with display text
    Hypertext links look like this: [http://www.google.com/]

== Escape code markup

Pod-style escape text is passed through as normal to support international
or other unusual characters.

    This is the euro symbol: E<euro> 

= DIAGNOSTICS

* {Error: Argument to convert() must be a scalar}
* {Error: Argument to filter() must be a hash reference}
* {Error: Argument to format() must be a scalar}
* {Error: Argument to new() must be a hash reference}
* {Error: Class method new() can't be called on an object}
* {Error: Couldn't open input file 'FILENAME'}
* {Error: Couldn't open output file 'FILENAME'}
* {Error: 'input' parameter for filter() must be a filename or filehandle}
* {Error: 'output' parameter for filter() must be a filename or filehandle}
    
= DEPENDENCIES

Pod::WikiDoc and the 'wikidoc' script depend on the following modules:
* [Getopt::Std]
* [IO::String]
* [Parse::RecDescent]
* [Pod::Usage]
* [Scalar::Util]

= INCOMPATIBILITIES

* Default prefix length for wikidoc comment-blocks conflicts with
[Smart::Comments].  Change the {comment_prefix_length} argument to {new} in
Pod::WikiDoc or the level of 'smartness' in [Smart::Comments] to avoid the
conflict.

* Module::Build (as of 0.27_02) does not look in external {.pod} files 
to generate a {README} with the {create_readme} option or to find a module 
abstract.  Set the abstract manually in the {Build.PL} file with the
{dist_abstract} option.

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

