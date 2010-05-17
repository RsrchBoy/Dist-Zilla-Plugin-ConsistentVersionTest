package Dist::Zilla::Plugin::ConsistentVersionTest;

use strict;
use warnings;

use Test::ConsistentVersion;

use Moose;

extends 'Dist::Zilla::Plugin::InlineFiles';

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
