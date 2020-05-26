requires 'Mojo::Base';
requires 'Mojo::Promise';
requires 'Moo';
requires 'Moo::Role';
requires 'Types::Standard';
requires 'perl', '5.028';

on configure => sub {
    requires 'Module::Build::Tiny', '0.034';
};

on test => sub {
    requires 'Test::More';
    requires 'Test::Warn';
};


