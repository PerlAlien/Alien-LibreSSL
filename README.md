# Alien::LibreSSL [![Build Status](https://secure.travis-ci.org/plicease/Alien-LibreSSL.png)](http://travis-ci.org/plicease/Alien-LibreSSL) ![windows](https://github.com/plicease/Alien-LibreSSL/workflows/windows/badge.svg) ![macos](https://github.com/plicease/Alien-LibreSSL/workflows/macos/badge.svg)

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

Normally [Alien::Build](https://metacpan.org/pod/Alien::Build) + [alienfile](https://metacpan.org/pod/alienfile) use [Net::SSLeay](https://metacpan.org/pod/Net::SSLeay) (via [HTTP::Tiny](https://metacpan.org/pod/HTTP::Tiny) or
[LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent)) in order to download `https` URLs from the internet, but for
this to be a dependency of [Net::SSLeay](https://metacpan.org/pod/Net::SSLeay) that will obviously not work.  Instead
this alien attempts to bootstrap SSL by downloading via `wget` or `curl`, if
they are available.  By default, if they are not available then this Alien will
attempt to download via `http`.  This obviously might not be desirable for some
so you can set `ALIEN_OPENSSL_FTP` to `0` if you want to ensure the transfer
happens over `https` (and will die, if it isn't available).

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
