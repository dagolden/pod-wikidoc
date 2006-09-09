# Pod::WikiDoc - check module loading and create testing directory

use Test::More tests =>  4 ;

BEGIN { use_ok( 'Pod::WikiDoc' ); }

my $object = Pod::WikiDoc->new ();
isa_ok ($object, 'Pod::WikiDoc');
isa_ok ($object, 'Pod::Simple');
can_ok ($object, qw( format ) );
