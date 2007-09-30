#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;
use File::pushd;
use IO::File;
use Parse::RecDescent;

use vars qw( $VERSION );
$VERSION = "0.18";

# Load Text::Balanced into Parse::RecDescent
package Parse::RecDescent;
use Text::Balanced qw( extract_bracketed extract_delimited extract_tagged );
package main;

# Load grammar from __DATA__

my $grammar = do { local $/; <DATA> };

# Find target location

my ($target_name) = $ARGV[0];

my $target_file = IO::File->new( $target_name, ">" ) or die $!;

# Temporarily change to temp directory since PRD Precompile writes to
# current directory only
my $cd = tempd();

# Generate Parser file

$Parse::RecDescent::skip = q{};
Parse::RecDescent->Precompile( $grammar, "Pod::WikiDoc::Parser" );

# open it up and open destination
my $precompile = IO::File->new( "Parser.pm" ) or die $!;

# copy package statement line

print {$target_file} scalar <$precompile>;

# interpolate version and add it 

my $version_text = "\nuse vars qw( \$VERSION );\n\$VERSION";
$version_text .= " = $VERSION;\n\n";

print {$target_file} $version_text;

# copy precompiled parser

print {$target_file} <$precompile>;

# assemble intro pod

my $docs_text = <<'END_DOCS';
=begin wikidoc

= NAME

Pod::WikiDoc::Parser -- precompiled recursive descent parser for Pod::WikiDoc

= VERSION

This documentation refers to version %%VERSION%%.

= SYNOPSIS

    use Pod::WikiDoc::Parser;
 
    my $parser = Pod::WikiDoc::Parser->new();

    my $tree = $parser->WikiDoc( $text );

= DESCRIPTION

Pod::WikiDoc::Parser is a precompiled [Parse::RecDescent] parser for use with
[Pod::WikiDoc].  

A copy of the Parse::RecDescent grammar used is appended to the
Pod::WikiDoc::Parser source and this Pod file for reference or reuse by
others.

= USAGE

This module is a support module for Pod::WikiDoc and is not intended for
general use.  Given a string containing WikiDoc markup text, the parser
produces a data structure representing the parsed content.  The data structure
returned is an array of references to hashes.  Keys in the hash are:

* type: the parser rule that generated the hash
* content: either a reference to another AoH or a string of text
* level: (only for "Header" type hashes) the level of the header

See [Pod::WikiDoc] for details of the markup.

= SEE ALSO

There are numerous Perl wikitext parsers, formatters or translators, some of
which were instructive in designing this parser.  All the ones I could find are
included below for reference for those interested in the topic:

* CGI::Wiki::Formatter
* Convert::Wiki
* HTML::WikiConverter
* Kwiki::Formatter
* Pod::TikiWiki
* PurpleWiki::Parser::WikiText
* Template::Plugin::KwikiFormat
* Text::WikiFormat

= AUTHOR

David A. Golden (DAGOLDEN)

= COPYRIGHT AND LICENSE

Copyright (c) 2005, 2006, 2007 by David A. Golden

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at 
[http://www.apache.org/licenses/LICENSE-2.0]

Files produced as output though the use of this software, including
generated copies of boilerplate templates provided with this software,
shall not be considered Derivative Works, but shall be considered the
original work of the Licensor.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end wikidoc

=cut

END_DOCS

# Append version and grammar for reference

print {$target_file} "\n\n__END__\n\n", $docs_text;
print {$target_file} "\n\n=begin grammar\n\n", $grammar, "\n\n=end grammar\n\n";

exit;

#--------------------------------------------------------------------------#
# parser grammer is kept in __DATA__
#--------------------------------------------------------------------------#

__DATA__
    { use Text::Balanced qw( extract_tagged ) }

    WikiDoc:        
            Block(s?)
                { $return = [ grep { $_->{type} ne 'Empty_Line' } @{ $item[1] } ] }

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
        |   Empty_Line
                { $return = $item[1] }

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
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }
    
    Plain_Line:     
            /^[^*0\n\t\ ]|[*0][^\t\ ]/ /[^\n]+/ "\n"
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
        |   KeyWord
                { $return = $item[1] }
        |   Parens
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

    KeyWord:   
            { extract_tagged( $text, '%%', '%%' ) }
                { 
                    $return = { 
                        type    => $item[0],
                        content => substr( substr( $item[1], 2), 0, -2 ),
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

    Parens:
            { extract_bracketed( $text, '(' ) }
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline(
                            substr( substr( $item[1], 1), 0, -1 )
                        ),
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
    
