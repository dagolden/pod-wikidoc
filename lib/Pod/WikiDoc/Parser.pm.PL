#!/usr/bin/perl
use strict;
use warnings;
use File::pushd;
use Parse::RecDescent;

use vars qw( $VERSION );
$VERSION = "0.10";

# Load Text::Balanced into Parse::RecDescent
package Parse::RecDescent;
use Text::Balanced qw( extract_bracketed extract_delimited );
package main;

# Load grammer from __DATA__

my $grammer = do { local $/; <DATA> };

# Find target directory

my ($target_dir) = $ARGV[0] =~ m{ \A ( .+ )  / .+ \z }xms;

{
    # Temporarily change to target directory since PRD Precompile writes to
    # current directory only
    my $cd = pushd( $target_dir );

    # Generate Parser file

    $Parse::RecDescent::skip = q{};
    Parse::RecDescent->Precompile( $grammer, "Pod::WikiDoc::Parser" );
}

# Text to append to precompiled parser

# interpolate version and insert
my $version_text = <<"END_VERSION";

use vars qw( \$VERSION );
\$VERSION = $VERSION;

END_VERSION

# assemble intro pod

my $docs_text = <<'END_DOCS';

=head1 NAME

Pod::WikiDoc::Parser -- precompiled recursive descent parser for WikiDoc

=head1 SYNOPSIS

 use Pod::WikiDoc::Parser;
 
 my $parser = Pod::WikiDoc::Parser->new();

 my $tree = $parser->WikiDoc( $text );

=head1 DESCRIPTION

This is a precompiled L<Parse::RecDescent> parser for use with L<Pod::WikiDoc>.
It is generated dynamically on installation of L<Pod::WikiDoc> from a grammer
included in the distribution.  

A copy of the L<Parse::RecDescent> grammer is appended to this source file for
reference or reuse by others.

=head1 USAGE

This module is a support module and is not intended for general use.  Given
a string containing WikiDoc markup text, the parser produces a data structure
representing the parsed content.  The data structure is a


=head1 BUGS

Please report bugs using the CPAN Request Tracker at 
http://rt.cpan.org/NoAuth/Bugs.html?Dist=Pod-WikiDoc

=head1 AUTHOR

David A Golden (DAGOLDEN)

dagolden@cpan.org

http://dagolden.com/

=head1 COPYRIGHT

Copyright (c) 2005 by David A Golden

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut

END_DOCS

# Append version and grammer for reference

open my $fh, ">>", $ARGV[0] 
    or warn "Couldn't append grammer to Pod::WikiDoc::Parser";
if ( $fh ) {
    print $fh "\n\n__END__\n\n", $grammer;
    close $fh;
}

__DATA__
    WikiDoc:        
            Block(s?)
                { $return = [ grep { ref $_ } @{ $item[1] } ] }

    Block:          
            Header 
                { $return = $item[1] }
        |   Unordered_List 
                { $return = $item[1] }
        |   Ordered_List 
                { $return = $item[1] }
        |   Preformat
                { $return = $item[1] }
        |   Paragraph
                { $return = $item[1] }
        |   Empty_Line(s)
                { $return = "" }

    Header:         
            /^=+/ /[\t\ ]+/ /[^\n]*/ "\n" 
                { 
                    $return = { 
                        type    => $item[0],
                        level   => length($item[1]),
                        content => $thisparser->Inline( $item[3] ),
                    }
                }

    Unordered_List: 
            Bullet_Item(s) Empty_Line(?)
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }
    
    Bullet_Item:    
            Bullet_Line List_Continuation(s?)
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( join( "\n", $item[1],  @{$item[2]} ) ),
                    }
                }
    
    Bullet_Line:    
            /^\*[\t\ ]*\n/
                { $return = q{} }
        |   /^\*[\t\ ]+/ /[^\n]*/ "\n"
                { $return = $item[2] }

    Ordered_List:   
            Numbered_Item(s) Empty_Line(?)
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }
    
    Numbered_Item:  
            Numbered_Line List_Continuation(s?)
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( 
                            join( "\n", $item[1],  @{$item[2]} ) 
                        ),
                    }
                }
    
    Numbered_Line:  
            /^0[\t\ ]*\n/ 
                { $return =  q{} }
        |   /^0[\t\ ]+/ /[^\n]*/ "\n"
                { $return = $item[2] }

    List_Continuation: 
            /^[^*0\s]/ /[^\n]*/ "\n"
                { $return = $item[1] . $item[2] }
    
    Preformat:      
            Indented_Line(s) Indent_Continuation(s?) Empty_Line(?)
                { 
                    $return = { 
                        type    => $item[0],
                        content => [ @{$item[1]}, map { @{$_} } @{$item[2]} ],
                    }
                }
    
    Indented_Line:  
            /^[\t\ ]+/ /[^\t\n\ ]+/ /[^\n]*/ "\n"
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1] . $item[2] . $item[3],
                    }
                }

    Indent_Continuation:
            Empty_Line(s) Indented_Line(s)
                { $return = [ @{$item[1]}, @{$item[2]} ] }
                    
    Empty_Line:     
            /^[\t\ ]*/ "\n"
                { $return = $item[1] }
    
    Plain_Line:     
            /^[^*0\n]|[*0][^\t\ ]/ /[^\n]+/ "\n"
                { $return =  $item[1] . $item[2] . $item[3] }

    Paragraph:      
            Plain_Line(s)
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( 
                            join( q{}, @{$item[1]} )
                        ),
                    }
                }

    Inline: 
            Chunk(s?)
                { $return = $item[1] }

    Chunk:
            WhiteSpace
                { $return = $item[1] }
        |   InlineCode
                { $return = $item[1] }
        |   BoldText
                { $return = $item[1] }
        |   ItalicText
                { $return = $item[1] }
        |   LinkText
                { $return = $item[1] }
        |   EscapedChar
                { $return = $item[1] }
        |   RegularText
                { $return = $item[1] }

    InlineCode:   
            { extract_bracketed( $text, '{' ) }
                { 
                    $return = { 
                        type    => $item[0],
                        content => substr( substr( $item[1], 1), 0, -1 ),
                    }
                }


    BoldText:   
            { extract_delimited( $text, '*' ) }
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline(
                            substr( substr( $item[1], 1), 0, -1 )
                        ),
                    }
                }

    ItalicText: 
            { extract_delimited( $text, '~' ) }
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline(
                            substr( substr( $item[1], 1), 0, -1 )
                        ),
                    }
                }

    LinkText:   
            { extract_bracketed( $text, '[' ) }
                { 
                    $return = $thisparser->LinkContent( 
                        substr( substr( $item[1], 1), 0, -1 )
                    ),
                }

    EscapedChar:
            "E" { extract_bracketed( $text, '<' ) }
                {
                    $return = { 
                        type    => $item[0],
                        content => $item[1] . $item[2]
                    }
                }

    RegularText:  
            m{ ^ \S+ }x
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }

    WhiteSpace:  
            m{ ^ \s+ }x
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }

    LinkContent:
            LinkLabel "\|" LinkTarget
                {   
                    $return = { 
                        type    => $item[0],
                        content => [ $item[1], $item[3] ],
                    }
                }
        |   LinkTarget
                {
                    $return = { 
                        type    => $item[0],
                        content => [ $item[1] ],
                    }
                }

    LinkLabel:
            /^[^|]*/
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( $item[1] ),
                    }
                }

    LinkTarget:
            /.+/
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }
    
