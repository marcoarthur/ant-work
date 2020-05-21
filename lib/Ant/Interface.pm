package Ant::Interface;

use Moo::Role;
use Types::Standard -types;
use 5.028;
use Mojo::Promise;
use Mojo::Base -async_await, -signatures;

use constant TIMEOUT => 5;
our $VERSION = '0.01';

has work => (
    is        => 'ro',
    isa       => CodeRef,
    predicate => 1,
    required  => 1,
);

has description => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


async sub execute ( $self, $args ) {
    my $p = Mojo::Promise->new(
        sub ( $resolve, $reject ) {
            my $res = $self->work->($args);
            $res ? $resolve->($res) : $reject->($res);
        }
    )->timeout(TIMEOUT);
    return $p;
}

1;
__END__

=encoding utf-8

=head1 NAME

Ant::Interface - Blah blah blah

=head1 SYNOPSIS

  use Ant::Interface;

=head1 DESCRIPTION

Ant::Interface is

=head1 AUTHOR

Marco Arthur E<lt>arthurpbs@gmail.comE<gt>

=head1 COPYRIGHT

Copyright 2020- Marco Arthur

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
