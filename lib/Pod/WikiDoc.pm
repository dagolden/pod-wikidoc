package Pod::WikiDoc;
use strict;
use warnings;
use vars qw($VERSION );
$VERSION     = "0.10";

use base 'Pod::Simple';
use Carp;
use Parse::RecDescent;
use Pod::WikiDoc::Parser;

#--------------------------------------------------------------------------#
# main pod documentation 
#--------------------------------------------------------------------------#

# Below is the stub of documentation for your module. You better edit it!


sub new {
    my $class = shift;
    my $self = Pod::Simple->new(@_);

    # setup for pod filtering
    $self->accept_targets( 'wikidoc' );
    $self->{in_wikidoc} = 0;

    # load up a parser 
    $self->{parser} = Pod::WikiDoc::Parser->new();
    
    return bless $self, $class;
}

sub filter {
    my ($self, $string) = @_;

    # break up input -- insure trailing blank line to ensure pod 
    # paragraphs end with blank line
    my @input_lines = split( /\n/, $string);

    # initialize flags and buffers
    my $in_pod      = 0; # not in a Pod section at start
    my $in_begin    = 0; # not in a begin section 
    my $in_wikidoc  = 0; # not in a wikidoc section
    my (@output, @wikidoc);
    
    # process line-by-line
    my $line;
    LINE:
    while ( defined ($line = shift @input_lines) ) {
        if ( not $in_pod ) {
            if ( $line =~ m{ \A = ([a-zA-Z]\S*) }xms ) {
                my $command = $1;
                
                # =cut can't start pod
                next LINE if $command eq "cut";

                $in_pod = 1;
                redo LINE;
            }
        }
        elsif ( $in_wikidoc ) {
            # see if we're done -- =begin/=end or =for/blankline
            if (    (   $in_begin && $line =~ m{\A =end \s+ wikidoc}xms )
                 || ( ! $in_begin && $line =~ m{\A \s*  \z         }xms ) ) {
                
                push @output, _translate_wikidoc( $self, \@wikidoc );
                @wikidoc = ();
                $in_wikidoc = $in_begin = 0;
                next LINE;
            }
            # not done, so store up the wikidoc
            push @wikidoc, $line;
            # if not more lines, process wikidoc now
            if ( @input_lines == 0 ) {
                push @output, _translate_wikidoc( $self, \@wikidoc );
            }
            next LINE;
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
                # if last line, process a =for para now now
                if ( ! $in_begin && @input_lines == 0 ) {
                    push @output, _translate_wikidoc( $self, $para );
                }
                next LINE;
            }
            push @output, $line;
        }
    }

    my $result = join "\n", @output; 
    if ( $result ne "" && substr( $result, -1, 1 ) ne "\n" ) {
        $result .= "\n";
    }
    return $result;
}

sub _translate_wikidoc {
    my ( $self, $wikidoc_ref ) = @_;
    my $converted = $self->format( join "\n", @$wikidoc_ref, q{} );
    return split( "\n", $converted );
}
    
sub _handle_element_start {
    my($parser, $element_name, $attr_hash_ref) = @_;
    if ( $element_name eq 'for' && $attr_hash_ref->{target} eq 'wikidoc' ) {
        $parser->{in_wikidoc} = 1;
    }

#    print "START: $element_name\n"; # Attr hash: ", Dumper $attr_hash_ref;
}

sub _handle_text {
    my($parser, $text) = @_;
    if ( $parser->{in_wikidoc} ) {
        print { $parser->{output_fh} } $text, "\n";
    }
#    print "TEXT: '$text'\n";
}

sub _handle_element_end {
    my($parser, $element_name) = @_;
    if ( $element_name eq 'for' ) {
        $parser->{in_wikidoc} = 0;
    }
    elsif ( $element_name eq 'Data' ) {
        print { $parser->{output_fh} } "\n";
    }
#    print "END: $element_name\n";
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

sub format {
    my ($self, $wikitext) = @_;
    
    my $wiki_tree  = $self->{parser}->WikiDoc( $wikitext ) ;
    for my $node ( @$wiki_tree ) {
        undef $node if ! ref $node;
    }

    return _wiki2pod( $wiki_tree );
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

