use strict;
use Test::More;
use Mojo::Promise;

use_ok 'Ant';

sub ant_test {
    my ( $w, $res, $desc ) = @_;
    my $a = Ant->new( work => $w, description => $desc );
    isa_ok( $a, 'Ant' );
    can_ok( $a, qw(work) );
    is $a->description, $desc, "ok work description";
    isa_ok( my $p = $a->execute_p( [] ), "Mojo::Promise" );
    $p->then( sub { is( $_[0], $res, "Promised Code executed" ) } )
      ->catch( sub { like $_[0], qr/Error.*/, "Promised Code executed with error" } )->wait;
    is_deeply [ @{ $a->execute( [] ) } ], [$res], "Block Code exec";

    # new Ant with a 2 secs work
    $a = Ant->new( work => sub { Mojo::Promise->timer( 2 => "two secs" ) } );
    my $ret = $a->execute( [], 0.025 );    # execute within 0.025 secs
    is $ret->[0], undef, "Code timeout'ed"; # timeout
}

ant_test( sub { "no work" }, "no work", "my work description" );

done_testing;
