package Exporter::Tiny;

our $VERSION = "0.01";
use strict;
use warnings;
use Carp qw(croak);
use Scalar::Util qw(refaddr);
use Package::Stash;

sub _import {
    my ( $from, $to, @what ) = @_;

    my $stash     = Package::Stash->new($from);
    my $pkg_stash = Package::Stash->new($to);

    for my $symbol (@what) {

        croak "are you sure you want to import '$symbol'?" unless $symbol;

        my $with_sigil 
            =  scalar grep({ !index($symbol,$_,0)} (qw( $ % @ & )))
                ? $symbol : '&'.$symbol;

        my $got_symbol = $pkg_stash->get_symbol($with_sigil);

        croak "$from doesn't export $symbol ($with_sigil)" unless $stash->has_symbol($with_sigil);
        croak "$from already has $symbol" 
            if $got_symbol && refaddr($got_symbol) != refaddr($stash->get_symbol($with_sigil));

        next if $got_symbol && refaddr($stash->get_symbol($with_sigil)) == refaddr($got_symbol);

        $pkg_stash->add_symbol($with_sigil,$stash->get_symbol($with_sigil));
    }
}

sub import {
    my $class   = shift;
    my $pkg     = caller();

    my @symbols = @_ || return;

    my $stash = Package::Stash->new($pkg);
    $stash->add_symbol('@EXPORT_OK', \@symbols);

    $stash->add_symbol('&import', sub {
        my $class = shift;
        my $pkg   = caller();
        _import($class, $pkg, @_);
    });
}


=head1 NAME

Exporter::Tiny

=head1 SYNOPSIS

    package MyApp;
    use Exporter::Tiny qw(foo bar);

    ...;

    package main;
    
    use MyApp qw( foo bar );

=head1 DESCRIPTION

Only the following export functionality is provided:

=over 

=item * export of constants, subroutines, scalars, arrays, hashes

=item * everything defined for export is exported by default

=item * basic error checks

=bach

=head1 BUGS

Please report any bugs on L<http://rt.cpan.org>

=head1 SEE ALSO

L<Exporter>

L<Sub::Exporter>

L<Exporter::TypeTiny>


=head1 AUTHOR

Tomasz Czepiel E<lt>tjmc@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.






1;
