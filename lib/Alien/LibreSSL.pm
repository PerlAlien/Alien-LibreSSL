package Alien::LibreSSL;

use strict;
use warnings;
use 5.008001;
use base qw( Alien::Base );

# ABSTRACT: Alien wrapper for LibreSSL (alternative to OpenSSL)
# VERSION

=head1 SYNOPSIS

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

=head1 DESCRIPTION

This module provides an implementation of SSL.  It will use the system
SSL, if it can be found.  If the system does not provide SSL, this alien
will download and build LibreSSL, a drop in replacement for OpenSSL

=head2 Motiviations

SSL has lots of pitfalls.  SSL on Perl has all of those pitfalls plus some
more.  Once you get L<Net::SSLeay> you are mostly out of the woods.  Getting
L<Net::SSLeay> to install can be problematic on some platforms.  My hope is that
some combination of this module and L<Alien::OpenSSL> will one day make it easier
to install L<Net::SSLeay>.

=head1 SEE ALSO

=over 4

=item L<Alien>

=item L<Alien::OpenSSL>

=back

=cut

1;
