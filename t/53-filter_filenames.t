# Pod::WikiDoc - check module loading and create testing directory

use Test::More;
use File::Temp;
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

        # setup temporary files
        my $output_file = File::Temp->new();
        my $input_file = File::Temp->new();

        # File::Temp defaults to binmode so change that on Windows
        if ( $^O eq 'MSWin32' ) {
            binmode $output_file, ":crlf";
            binmode $input_file, ":crlf";
        }
        
        # init the input file
        print $input_file $input_string;
        seek $input_file, 0, 0;

        # process input to output
        $parser->filter( { input => $input_file->filename, 
                           output => $output_file->filename } 
        );

        # recover output for testing
        seek $output_file, 0, 0;
        return do { local $/; <$output_file> };
    }
);

