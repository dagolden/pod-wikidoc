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

Pod::WikiDoc - Put abstract here 

= SYNOPSIS

    use Pod::WikiDoc;
    blah blah blah

= DESCRIPTION

Description...

= USAGE

Usage...

=end wikidoc

=cut

#--------------------------------------------------------------------------#
# PUBLIC METHODS
#--------------------------------------------------------------------------#

#--------------------------------------------------------------------------#
# new()
#
# Constructor.  At the moment, takes no arguments.
#--------------------------------------------------------------------------#

sub new {
    my $class = shift;

    croak "Error: Class method new() can't be called on an object"
        if ref $class;

    my $self = {};

    # load up a parser 
    $self->{parser} = Pod::WikiDoc::Parser->new();
    
    return bless $self, $class;
}

#--------------------------------------------------------------------------#
# convert()
#
# Given a string with Pod and/or WikiDoc, filter/translate it to Pod. 
# Really just a wrapper around filter()
#--------------------------------------------------------------------------#

sub convert {
    my ($self, $input_string) = @_;

    croak "Error: Argument to convert() must be a scalar"
        if ( ref \$input_string ne 'SCALAR' );
        
    my $input_fh = IO::String->new( $input_string );
    my $output_fh = IO::String->new();
    _filter_podfile( $self, $input_fh, $output_fh );
    
    return ${ $output_fh->string_ref() };
}

#--------------------------------------------------------------------------#
# filter()
#
# Given an optional hashref with keys "input" and/or "output", filters
# the input for Pod/WikiDoc, translating it to Pod on the output. 
# "input" and "output" default to STDIN and STDOUT. Input and output can
# be specified as either filehandles (or a reference to one) or as 
# filenames.  Given an output filename, the file will be clobbered.
#--------------------------------------------------------------------------#

sub filter {
    my ( $self, $args_ref ) = @_;
    
    croak "Error: Argument to filter() must be a hash reference"
        if defined $args_ref && ref($args_ref) ne 'HASH';
    # setup input
    my $input_fh;
    if ( ! exists $args_ref->{input} ) {
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
            or croak "Error: Couldn't open input file '$args_ref->{input}'";
    }
    else {
        croak "Error: Invalid variable type for input file argument to filter()";
    }
    
    # setup output
    my $output_fh;
    if ( ! exists $args_ref->{output} ) {
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
            or croak "Error: Couldn't open output file '$args_ref->{output}'";
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
# _filter_podfile() 
#
# extract Pod from input and pass through to output, converting any wikidoc
# markup to Pod in the process
#--------------------------------------------------------------------------#

my $MATCHES_SHARPDOC = qr{\A### (.*)?\z}ms;

sub _filter_podfile {
    my ($self, $input_fh, $output_fh) = @_;

    # initialize flags and buffers
    my $in_pod      = 0; # not in a Pod section at start
    my $in_begin    = 0; # not in a begin section 
    my $in_wikidoc  = 0; # not in a wikidoc section
    my $in_sharpdoc = 0; # not in a wikidoc comment section
    my @wikidoc;
    
    # open output with Pod marker
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
        elsif ( ( ! $in_pod ) && $in_sharpdoc ) {
            # capture a sharpdoc line
            if ( $line =~ $MATCHES_SHARPDOC ) {
                my $sharptext = defined $1 ? $1 : q{};
                push @wikidoc, $sharptext; 
                next LINE;
            }
            else { 
                print $output_fh _translate_wikidoc( $self, \@wikidoc );
                @wikidoc = ();
                $in_sharpdoc = 0;
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
            # if it's a doc comment, flag and restart
            elsif ( $line =~ $MATCHES_SHARPDOC ) {
                $in_sharpdoc = 1;
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

= WIKIDOC GRAMMAR

Wikidoc is composed of both block and inline markup.

Block markup:

    = header level 1
    
    == header level 2

Inline markup:

    *bold*

    ~italic~

    [link]

    {monospace aka code}

    \escapes
    
= SEE ALSO

* HTML::WikiConverter
* Text::WikiFormat
* Template::Plugin::KwikiFormat
* PurpleWiki::Parser::WikiText
* Pod::TikiWiki
* Convert::Wiki
* Kwiki::Formatter
* CGI::Wiki::Formatter::*

= BUGS

Please report bugs using the CPAN Request Tracker at 
http://rt.cpan.org/NoAuth/Bugs.html?Dist=Pod-WikiDoc

= AUTHOR

David A Golden (DAGOLDEN)

dagolden@cpan.org

http://dagolden.com/

= COPYRIGHT

Copyright (c) 2005 by David A Golden

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=end wikidoc

