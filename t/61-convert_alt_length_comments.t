# Pod::WikiDoc - check module loading and create testing directory

use Test::More;
use IO::String;
use t::Casefiles;

use Pod::WikiDoc;

#--------------------------------------------------------------------------#
# case file runner
#--------------------------------------------------------------------------#

my $cases = t::Casefiles->new( "t/filter_comments_alt" );

$cases->run_tests( 
    sub { 
        my $input = shift;
        my ( $length, $string ) = $input =~ m{\A (\d+) \n (.+) \z }xms;
        my $parser = Pod::WikiDoc->new( { 
            comment_doc => 1,
            comment_doc_length => $length,
        });
        return $parser->convert( $string );
    }
);

