package Pod::WikiDoc;
use strict;
use warnings;
use vars qw($VERSION );
$VERSION     = "0.10";

use 5.006;
use Carp;
use IO::String;
use Pod::WikiDoc::Parser;


#--------------------------------------------------------------------------#
# PUBLIC METHODS
#--------------------------------------------------------------------------#

sub new {
    my $class = shift;
    my $self = {};

    # load up a parser 
    $self->{parser} = Pod::WikiDoc::Parser->new();
    
    return bless $self, $class;
}

sub convert {
    my ($self, $input_string) = @_;

    my $input_fh = IO::String->new( $input_string );
    my $output_fh = IO::String->new();
    _filter_podfile( $self, $input_fh, $output_fh );
    
    return ${ $output_fh->string_ref() };
}

sub filter {
    my ( $self, $args_ref ) = @_;
    
    croak "Error: Argument to filter() must be a hash reference"
        if defined $args_ref && ! ref($args_ref) eq 'HASH';
    # setup input
    my $input_fh;
    if ( ! exists $args_ref->{input} ) {
        $input_fh = \*STDIN;
    }
    elsif ( (ref $args_ref->{input} && $args_ref->{input}->isa('GLOB') ) 
         || ref \$args_ref->{input} eq 'GLOB' ) {
        # filehandle
        $input_fh = $args_ref->{input};
    } 
    elsif ( ref \$args_ref->{input} eq 'SCALAR' ) {
        # filename
        open( $input_fh, "<", $args_ref->{input} )
            or croak "Error: Couldn't open input file '$input_fh'";
    }
    else {
        die "Error: invalid input file argument";
    }
    
    # setup output
    my $output_fh;
    if ( ! exists $args_ref->{output} ) {
        $output_fh = \*STDOUT;
    }
    elsif ( (ref $args_ref->{output} && $args_ref->{output}->isa('GLOB'))
         || ref \$args_ref->{output} eq 'GLOB' ) {
        # filehandle
        $output_fh = $args_ref->{output};
    } 
    elsif ( ref \$args_ref->{output} eq 'SCALAR' ) {
        # filename
        open( $output_fh, ">", $args_ref->{output} )
            or croak "Error: Couldn't open output file '$output_fh'";
    }
    else {
        die "Error: invalid output file argument";
    }
    
    _filter_podfile( $self, $input_fh, $output_fh );
    return;
}

sub format {
    my ($self, $wikitext) = @_;
    
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

sub _filter_podfile {
    my ($self, $input_fh, $output_fh) = @_;

    # initialize flags and buffers
    my $in_pod      = 0; # not in a Pod section at start
    my $in_begin    = 0; # not in a begin section 
    my $in_wikidoc  = 0; # not in a wikidoc section
    my @wikidoc;
    
    # open output with Pod marker
    print $output_fh "=pod\n\n";
    
    # process line-by-line
    my $line;
    LINE:
    while ( defined( $line = <$input_fh> ) ) {
        if ( not $in_pod ) {
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
        }
        elsif ( $in_wikidoc ) {
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
            # if not more lines, process wikidoc now
            $line = <$input_fh>;
            if ( ! defined $line ) {
                print $output_fh _translate_wikidoc( $self, \@wikidoc );
                last LINE;
            }
            redo LINE;
        }
        else {
            if ( $line =~ m{ \A =cut }xms ) {
                $in_pod = 0;
                next LINE;
            }
            if ( $line =~ m{ \A =(begin|for) \s+ wikidoc \s* (.*)}xms ) {
                my ($command, $para) = ($1, $2);
                
                $in_wikidoc = 1;
                $in_begin = $command eq 'begin' ? 1 : 0;
                
                # if =for wikidoc, then store $para
                if ( ! $in_begin && defined $para && length $para ) {
                    push @wikidoc, $para;
                }
                # if last line, process a =for para now
                $line = <$input_fh>;
                if ( ! $in_begin && ! defined $line ) {
                    print $output_fh _translate_wikidoc( $self, $para );
                }
                redo LINE;
            }
            print $output_fh $line;
        }
    }

    return;
}

#--------------------------------------------------------------------------#
# Translation functions and tables
#--------------------------------------------------------------------------#

sub _translate_wikidoc {
    my ( $self, $wikidoc_ref ) = @_;
    return $self->format( join q{}, @$wikidoc_ref );
}
    
my $numbered_bullet;

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

my %content_handler_for = (
    RegularText         =>  \&_escape_pod, 
    Empty_Line          =>  sub { q{} },
);

my %escape_code_for = (
    ">" =>  "E<gt>",
    "<" =>  "E<lt>",
    "|" =>  "E<verbar>",
    "/" =>  "E<sol>",
);

my $specials = join q{}, keys %escape_code_for;

sub _escape_pod {
    my $node = shift;
    my $input_text  = $node->{content};
    
    # remove backslash escaping
    $input_text =~ s{ \\(.) } # backslash followed by anything
                    {$1}gxms;
    
    # replace special symbols with corresponding escape code
    $input_text =~ s{ ( [$specials] ) }
                    {$escape_code_for{$1}}gxms;
    return $input_text;
}

sub _wiki2pod {
    my ($nodelist, $insert_space) = @_;
    my $result = q{};
    for my $node ( @$nodelist ) {
        print "$node\n" if ref $node ne 'HASH';
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

= NAME

Pod::WikiDoc - Put abstract here 

= SYNOPSIS

    use Pod::WikiDoc;
    blah blah blah

= DESCRIPTION

Description...

= USAGE

Usage...

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

