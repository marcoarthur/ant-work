# NAME

Ant - A single Ant

# SYNOPSIS

    use Ant;
    my $a = Ant->new( work => sub { "do work" }, description => "some work" );
    say $a->execute; #do work

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
