# Pod::WikiDoc - check module loading and create testing directory

use Test::More;
use t::Casefiles;

use Pod::WikiDoc;

#--------------------------------------------------------------------------#
# parser setup
#--------------------------------------------------------------------------#

sub _new_parser {
    my $parser = Pod::WikiDoc->new ();
    $parser->output_string( shift );
    return $parser;
}

#--------------------------------------------------------------------------#
# case file runner
#--------------------------------------------------------------------------#

my $cases = t::Casefiles->new( "t/extraction" );

$cases->run_tests( 
    sub { 
        my $got;
        my $parser = _new_parser( \$got )->parse_string_document( shift ); 
        return $got 
    }
);

