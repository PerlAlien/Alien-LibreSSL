# Alien::LibreSSL [![Build Status](https://api.cirrus-ci.com/github/Perl5-Alien/Alien-LibreSSL.svg)](https://cirrus-ci.com/github/Perl5-Alien/Alien-LibreSSL) [![Build Status](https://secure.travis-ci.org/Perl5-Alien/Alien-LibreSSL.png)](http://travis-ci.org/Perl5-Alien/Alien-LibreSSL) ![windows-share](https://github.com/Perl5-Alien/Alien-LibreSSL/workflows/windows-share/badge.svg) ![windows-system](https://github.com/Perl5-Alien/Alien-LibreSSL/workflows/windows-system/badge.svg) ![macos-system](https://github.com/Perl5-Alien/Alien-LibreSSL/workflows/macos-system/badge.svg) ![macos-share](https://github.com/Perl5-Alien/Alien-LibreSSL/workflows/macos-share/badge.svg)

Alien wrapper for LibreSSL (alternative to OpenSSL)

# SYNOPSIS

EUMM:

```perl
use ExtUtils::MakeMaker;
use Alien::Base::Wrapper qw( Alien::LibreSSL !export );

WriteMakefile(
  ...
  CONFIGURE => {
    'Alien::Build::Wrapper' => 0,
    'Alien::LibreSSL'       => 0,
  },
  Alien::Base::Wrapper->mm_args,
);
```

MB:

```perl
use Module::Build;
use Alien::Base::Wrapper qw( Alien::LibreSSL !export );

my $build = Module::Build->new(
  ...
  configure_requires => {
    'Alien::Build::Wrapper' => 0,
    'Alien::LibreSSL'       => 0,
  },
  Alien::Base::Wrapper->mb_args,
  ...
);

$build->create_build_script;
```

Perl script:

```perl
use Alien::LibreSSL;
use Env qw( @PATH );

unshift @PATH, 'Alien::LibreSSL->bin_dir;
system 'openssl ...';
```

# DESCRIPTION

This module provides an implementation of SSL.  It will use the system
SSL, if it can be found.  If the system does not provide SSL, this alien
will download and build LibreSSL, a drop in replacement for OpenSSL

## Motivation

SSL has lots of pitfalls.  SSL on Perl has all of those pitfalls plus some
more.  Once you get [Net::SSLeay](https://metacpan.org/pod/Net::SSLeay) you are mostly out of the woods.  Getting
[Net::SSLeay](https://metacpan.org/pod/Net::SSLeay) to install can be problematic on some platforms.  My hope is that
some combination of this module and [Alien::OpenSSL](https://metacpan.org/pod/Alien::OpenSSL) will one day make it easier
to install [Net::SSLeay](https://metacpan.org/pod/Net::SSLeay).

# CAVEATS

None of this applies to a system install where OpenSSL or LibreSSL is already
installed.

Retrieving LibreSSL or OpenSSL via the internet when you do not already have an
SSL implementation introduces a bootstrapping problem.  Newer versions of
[Alien::Build](https://metacpan.org/pod/Alien::Build) + [alienfile](https://metacpan.org/pod/alienfile) prefer the use of `curl` over [Net::SSLeay](https://metacpan.org/pod/Net::SSLeay)
because on some platforms it is more reliable.  Further, this Alien will try
to use `wget`.  `curl` and `wget` will only be used if they support the
`https` protocol.  If neither `curl`, `wget` are available and [Net::SSLeay](https://metacpan.org/pod/Net::SSLeay)
isn't _already_ installed, then this Alien will refuse to install because it
has no safe way of retreiving LibreSSL from the internet.  You can force
an insecure install via `ftp` or `http` using the `ALIEN_OPENSSL_FTP`
environment variable below, but that is NOT recommended.

# ENVIRONMENT

- ALIEN\_OPENSSL\_FTP

    Set to `1` to allow downloads via `ftp` or `http` (the default).
    Set to `0` to disallow insecure downloads over `ftp` or `http`.

# SEE ALSO

- [Alien](https://metacpan.org/pod/Alien)
- [Alien::OpenSSL](https://metacpan.org/pod/Alien::OpenSSL)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
