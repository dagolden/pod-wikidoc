#!/usr/bin/perl
use strict;
use warnings;
use File::pushd;
use Parse::RecDescent;

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

# Append grammer for reference

open my $fh, ">>", $ARGV[0] 
    or warn "Couldn't append grammer to Pod::WikiDoc::Parser";
if ( $fh ) {
    print $fh "\n\n__END__\n\n", $grammer;
    close $fh;
}

__DATA__
    WikiDoc:        Block(s?)
                    { $return = $item[1] }

    Block:          Header 
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

    Header:         /^=+/ /[\t\ ]+/ /[^\n]*/ "\n" 
                    { 
                        $return = { 
                            type    => $item[0],
                            level   => length($item[1]),
                            content => $thisparser->Inline( $item[3] ),
                        }
                    }

    Unordered_List: Bullet_Item(s) Empty_Line(?)
                    { 
                        $return = { 
                            type    => $item[0],
                            content => $item[1],
                        }
                    }
    
    Bullet_Item:    Bullet_Line List_Continuation(s?)
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( join( "\n", $item[1],  @{$item[2]} ) ),
                    }
                }
    
    Bullet_Line:    /^\*[\t\ ]*\n/
                    { $return = q{} }
                |   /^\*[\t\ ]+/ /[^\n]*/ "\n"
                    { $return = $item[2] }

    Ordered_List:   Numbered_Item(s) Empty_Line(?)
                    { 
                        $return = { 
                            type    => $item[0],
                            content => $item[1],
                        }
                    }
    
    Numbered_Item:  Numbered_Line List_Continuation(s?)
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( join( "\n", $item[1],  @{$item[2]} ) ),
                    }
                }
    
    Numbered_Line:  /^0[\t\ ]*\n/ 
                    { $return =  q{} }
                |   /^0[\t\ ]+/ /[^\n]*/ "\n"
                    { $return = $item[2] }

    List_Continuation: /^[^*0\s]/ /[^\n]*/ "\n"
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

    Inline: Chunk(s?)
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
        |   RegularText
                { $return = $item[1] }
        |   SpecialChar
                { $return = $item[1] }

    InlineCode:   { extract_bracketed( $text, '{' ) }
                { 
                    $return = { 
                        type    => $item[0],
                        content => substr( substr( $item[1], 1), 0, -1 ),
                    }
                }


    BoldText:   { extract_delimited( $text, '*' ) }
                { 
                    $return = { 
                        type    => $item[0],
                        content => substr( substr( $item[1], 1), 0, -1 ),
                    }
                }

    ItalicText: { extract_delimited( $text, '~' ) }
                { 
                    $return = { 
                        type    => $item[0],
                        content => substr( substr( $item[1], 1), 0, -1 ),
                    }
                }

    LinkText:   { extract_bracketed( $text, '[' ) }
                { 
                    $return = $thisparser->LinkContent( 
                        substr( substr( $item[1], 1), 0, -1 )
                    ),
                }

    RegularText:  m{ ^ \S+ }x
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }

    WhiteSpace:  m{ ^ \s+ }x
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }

    SpecialChar: m{ ^ \* | \[ }x
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
                        content => $item[1],
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
    
