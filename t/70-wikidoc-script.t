use Test::More;
use File::Spec;
use File::Temp;
use IPC::Run3;

plan tests => 5;

#--------------------------------------------------------------------------#
# Get optional test support
#--------------------------------------------------------------------------#

eval "use Test::Differences";
my $HAVE_DIFF = $@ eq '' ? 1 : 0;

sub diff_or_is {
    my ($got, $expected, $label ) = @_;

    if ( $HAVE_DIFF ) {
        eq_or_diff( $got, $expected, $label );
    }
    else {
        is( $got, $expected, $label );
    }
}

#--------------------------------------------------------------------------#
# locate perl and script
#--------------------------------------------------------------------------#

# From perlport:
use Config;
my $perl = $^X;
if ($^O ne 'VMS') {
    $perl .= $Config{_exe} unless $perl =~ m/$Config{_exe}$/i;
}

my $wikidoc = File::Spec->catfile( "scripts", "wikidoc" );

if ( ! -r $wikidoc ) {
    plan 'skip_all' => "because I couldn't find the wikidoc script to test";
}

#--------------------------------------------------------------------------#
# setup input and expected
#--------------------------------------------------------------------------#

my $input_string = <<'INPUT';
=for wikidoc = START

=cut

### = NAME
### wikidoc - a script
INPUT

my $expected = <<'EXPECTED';
=pod

=head1 START

EXPECTED

my $expected_c = <<'EXPECTED_C';
=pod

=head1 START

=head1 NAME

wikidoc - a script

EXPECTED_C

my $script_output = q{};
my $got = q{};
my @cmd;

#--------------------------------------------------------------------------#
# setup temporary files
#--------------------------------------------------------------------------#

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

#--------------------------------------------------------------------------#
# Start testing
#--------------------------------------------------------------------------#


#--------------------------------------------------------------------------#
# wikidoc file file
#--------------------------------------------------------------------------#

@cmd = ( $perl, $wikidoc, "$input_file", "$output_file" );

run3 \@cmd, undef, \$script_output;

like( $script_output, qr/Extracting Pod from \Q$input_file\E/,
    "'wikidoc file file' status message"
);

# recover output for testing
seek $output_file, 0, 0;
$got =  do { local $/; <$output_file> };

diff_or_is( $got, $expected, 
    "'wikidoc file file' output file contents" 
);

#--------------------------------------------------------------------------#
# wikidoc -c file file
#--------------------------------------------------------------------------#

@cmd = ( $perl, $wikidoc, "-c", "$input_file", "$output_file" );

run3 \@cmd, undef, \$script_output;

# recover output for testing
seek $output_file, 0, 0;
$got =  do { local $/; <$output_file> };

diff_or_is( $got, $expected_c, 
    "'wikidoc -c file file' output file contents" 
);

#--------------------------------------------------------------------------#
# wikidoc -c file 
#--------------------------------------------------------------------------#

@cmd = ( $perl, $wikidoc, "-c", "$input_file",  );

run3 \@cmd, undef, \$script_output;

diff_or_is( $script_output, $expected_c, 
    "'wikidoc -c file' output file contents" 
);

#--------------------------------------------------------------------------#
# wikidoc -c 
#--------------------------------------------------------------------------#

@cmd = ( $perl, $wikidoc, "-c",   );

run3 \@cmd, \$input_string, \$script_output;

diff_or_is( $script_output, $expected_c, 
    "'wikidoc -c' output file contents" 
);

