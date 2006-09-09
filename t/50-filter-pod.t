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

my $cases = t::Casefiles->new( "t/filter_pod" );

$cases->run_tests( 
    sub { 
        my $parser = Pod::WikiDoc->new;
        return $parser->filter( shift );
    }
);

