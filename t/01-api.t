# Pod::WikiDoc - check module loading and create testing directory

use Test::More tests =>  3 ;

BEGIN { use_ok( 'Pod::WikiDoc' ); }

my $object = Pod::WikiDoc->new ();
isa_ok ($object, 'Pod::WikiDoc');
can_ok ($object, qw( format convert ) );
