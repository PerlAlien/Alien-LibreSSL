# Alien::LibreSSL [![Build Status](https://secure.travis-ci.org/plicease/Alien-LibreSSL.png)](http://travis-ci.org/plicease/Alien-LibreSSL)

Alien wrapper for LibreSSL (alternative to OpenSSL)

# SYNOPSIS

EUMM:

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

MB:

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

Perl script:

    use Alien::LibreSSL;
    use Env qw( @PATH );
    
    unshift @PATH, 'Alien::LibreSSL->bin_dir;
    system 'openssl ...';

# DESCRIPTION

This module provides an implementation of SSL.  It will use the system
SSL, if it can be found.  If the system does not provide SSL, this alien
will download and build LibreSSL, a drop in replacement for OpenSSL

## Motiviations

SSL has lots of pitfalls.  SSL on Perl has all of those pitfalls plus some
more.  Once you get [Net::SSLeay](https://metacpan.org/pod/Net::SSLeay) you are mostly out of the woods.  Getting
[Net::SSLeay](https://metacpan.org/pod/Net::SSLeay) to install can be problematic on some platforms.  My hope is that
some combination of this module and [Alien::OpenSSL](https://metacpan.org/pod/Alien::OpenSSL) will one day make it easier
to install [Net::SSLeay](https://metacpan.org/pod/Net::SSLeay).

# SEE ALSO

- [Alien](https://metacpan.org/pod/Alien)
- [Alien::OpenSSL](https://metacpan.org/pod/Alien::OpenSSL)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
