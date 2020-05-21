package Ant;

use Moo;
use 5.028;
with qw(Ant::Interface);
our $VERSION = '0.01';

1;

__END__

=encoding utf-8

=head1 NAME

Ant - A single Ant

=head1 SYNOPSIS

  use Ant;

=head1 DESCRIPTION

Ant is capable of execute async work. Give it a job (function) it will wrap a
promise around and execute it.

=head1 AUTHOR

Marco Arthur E<lt>arthurpbs@gmail.comE<gt>

=head1 COPYRIGHT

Copyright 2020- Marco Arthur

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
