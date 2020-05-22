# NAME

Ant - A single Ant

# SYNOPSIS

    use Ant;
    use feature qw(say);
    my $a = Ant->new( work => sub { "worked on " . shift->[0] }, description => "some work" );
    my $res = $a->execute([$a->description]);
    say $res->[0]; #worked on some work

# DESCRIPTION

Ant is capable of execute async work. Give it a job (function) it will wrap a
promise around and execute it.

# AUTHOR

Marco Arthur <arthurpbs@gmail.com>

# COPYRIGHT

Copyright 2020- Marco Arthur

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
