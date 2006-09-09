# Pod::WikiDoc - check module loading and create testing directory

use Test::More;
use IO::String;
use t::Casefiles;

use Pod::WikiDoc;

#--------------------------------------------------------------------------#
# parser setup
#--------------------------------------------------------------------------#

my $parser = Pod::WikiDoc->new ();

#--------------------------------------------------------------------------#
# case file runner
#--------------------------------------------------------------------------#

my $cases = t::Casefiles->new( "t/filter_pod" );

$cases->run_tests( 
    sub { 
        my $input_string = shift;
        my $input_fh = IO::String->new( $input_string );
        my $output_fh = IO::String->new();
        $parser->_filter_podfile( $input_fh, $output_fh );
        return ${ $output_fh->string_ref() };
    }
);

