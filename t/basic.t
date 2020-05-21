use strict;
use Test::More;

use_ok 'Ant';

sub ant_test {
    my ( $w, $res, $desc ) = @_;
    $a = Ant->new( work => $w, description => $desc );
    isa_ok( $a, 'Ant' );
    can_ok( $a, qw(work) );
    is $a->description, $desc, "ok work description";
    isa_ok( my $p = $a->execute_p( [] ), "Mojo::Promise" );
    $p->then( sub { is( $_[0], $res, "Code executed" ) } )
      ->catch( sub { like $_[0], qr/Error.*/, "Code executed with error" } )->wait;
    is_deeply my $v = $a->execute( [] ), [$res], "Block exec";
}

ant_test( sub { "no work" }, "no work", "my work description" );

done_testing;
