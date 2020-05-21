use strict;
use Test::More;

use_ok 'Ant';

$a = Ant->new( work => sub { "no work" }, description => "easy work" );
isa_ok( $a, 'Ant' );
can_ok( $a, qw(work) );
is $a->description, "easy work", "work description";
ok( $a->execute( [] ), "Executed work" );
is( $a->execute( [] ), "no work", "Code executed" );

done_testing;
