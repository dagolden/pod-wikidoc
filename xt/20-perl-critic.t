use strict;
use warnings;
use File::Spec;
use Test::More tests => 1;
require Test::Perl::Critic;

my $rcfile = File::Spec->catfile( 'xt', 'perlcriticrc' );
Test::Perl::Critic->import( -profile => $rcfile );
critic_ok( File::Spec->catfile( qw/lib Pod WikiDoc.pm/ ) );
