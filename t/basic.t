use strict;
use Test::More;

use_ok 'Ant';

$a = Ant->new( work => sub { "no work" }, description => "easy work" );

SKIP: {
    skip "No work set", 1 unless $a->has_work;

    ok( $a->execute( [] ), "Executed work" );
}

is $a->description, "easy work", "work description";

done_testing;
