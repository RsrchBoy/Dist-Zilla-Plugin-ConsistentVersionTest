package Dist::Zilla::Plugin::ConsistentVersionTest;

use strict;
use warnings;

use Test::ConsistentVersion;

use Moose;

extends 'Dist::Zilla::Plugin::InlineFiles';
with 'Dist::Zilla::Role::PrereqSource';

=head1 METHODS

=head2 register_prereqs

Registers a 'develop' phase requirement for L<Test::ConsistentVersion> with the
L<Dist::Zilla> object.

=cut

sub register_prereqs {
    my $self = shift @_;

    $self->zilla->register_prereqs(
        { phase => 'develop' },
        'Test::ConsistentVersion' => 0,
    );

    return;
}

no Moose;

__PACKAGE__->meta->make_immutable;

1;

# ABSTRACT: Adds a release test to ensure that all modules have the same $VERSION

=pod

=head1 SYNOPSIS

In your F<dist.ini>:

  [ConsistentVersionTest]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following files

  xt/release/consistent-version.t

=head1 SUPPORT

Please report any bugs or feature requests to
C<bug-dist-zilla-plugin-consistentversiontest@rt.cpan.org>, or through the web
interface at L<http://rt.cpan.org>. I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 DONATIONS

If you'd like to thank me for the work I've done on this module, please
consider making a "donation" to me via PayPal. I spend a lot of free time
creating free software, and would appreciate any support you'd care to offer.

Please note that B<I am not suggesting that you must do this> in order for me
to continue working on this particular software. I will continue to do so,
inasmuch as I have in the past, for as long as it interests me.

Similarly, a donation made in this way will probably not make me work on this
software much more, unless I get so many donations that I can consider working
on free software full time, which seems unlikely at best.

To donate, log into PayPal and send money to autarch@urth.org or use the
button on this page: L<http://www.urth.org/~autarch/fs-donation.html>

=cut

__DATA__
___[ xt/release/consistent-version.t ]___
use strict;
use warnings;

use Test::More;

eval "use Test::ConsistentVersion";
plan skip_all => "Test::ConsistentVersion required for this test"
    if $@;

Test::ConsistentVersion::check_consistent_versions();
