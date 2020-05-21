use strict;
use Test::More;

use_ok 'Ant';

my $easy  = sub { "no work" };
my $heavy = sub { sleep 6 };

sub ant_test {
    my ( $w, $res, $desc ) = @_;
    $a = Ant->new( work => $w, description => $desc );
    isa_ok( $a, 'Ant' );
    can_ok( $a, qw(work) );
    is $a->description, $desc, "ok work description";
    isa_ok( my $p = $a->execute( [] ), "Mojo::Promise" );
    $p->then( sub { is( $_[0], $res, "Code executed" ) } )
      ->catch( sub { like $_[0], qr/Error.*/, "Code executed with error" } )->wait;
}

ant_test( sub { "no work" }, "no work", "work description" );

done_testing;
