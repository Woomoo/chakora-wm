#!/usr/bin/env perl

# Hashlib.pm - A proper interface to most useful modules in the Digest namespace.
# Copyright 2010 Alexandria Wolcott <alyx@woomoo.org>

# Copyright note: Although this file is included with Chakora, copyright is NOT
# held by the Chakora Project. This file is used under agreement with the
# copyright holder, Alexandria Marie Wolcott <alyx@woomoo.org>

# Note to Chakora devlopers:
#   All modifications must be approved by the upstream Hashlib maintainer(s).
#   Maintainers include all members of the Woomoo Development Team

# To appease PerlCritic:
#   $Id$ $Revision$ $HeadURL$ $Date$ $Source$

package Hashlib;
use strict;
use warnings;
use Carp qw(croak carp);

our $VERSION = 0.96;

sub new {
    my $class = shift;
    my $self = bless {}, $class;
    return $self;
}

# Hashing subroutines

sub adler32 {
    my @parv = @_;
    my $data;
    if ( !$parv[1] ) {
        croak( __PACKAGE__ . '::adler32: Missing required paramaters' );
    }
    if ( !$parv[2] ) {
        $data = $parv[1];
    }
    else { $data = $parv[2]; }
    eval { require Digest::Adler32 } or croak('Missing Digest::Adler32');

    my $hash = Digest::Adler32->new;
    $hash->add($data);

    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub blake {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::BLAKE: Missing required paramaters' );
    }
    eval { require Digest::BLAKE } or croak('Missing Digest::BLAKE');
    my $hash = Digest::BLAKE->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub bmw {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::BMW: Missing required paramaters' );
    }
    eval { require Digest::BMW } or croak('Missing Digest::BMW');
    my $hash = Digest::BMW->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub cubehash {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::cubehash: Missing required paramaters' );
    }
    eval { require Digest::CubeHash } or croak('Missing Digest::CubeHash');
    my $hash = Digest::CubeHash->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub echo {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::ECHO: Missing required paramaters' );
    }
    eval { require Digest::ECHO } or croak('Missing Digest::ECHO');
    my $hash = Digest::ECHO->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub edonr {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::EdonR: Missing required paramaters' );
    }
    eval { require Digest::EdonR } or croak('Missing Digest::ECHO');
    my $hash = Digest::EdonR->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub fugue {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::Fugue: Missing required paramaters' );
    }
    eval { require Digest::Fugue } or croak('Missing Digest::Fugue');
    my $hash = Digest::Fugue->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub gost {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::gost: Missing required paramaters' );
    }
    eval { require Digest::GOST } or croak('Missing Digest::GOST');
    my $hash = Digest::GOST::new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub groestl {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::Groestl: Missing required paramaters' );
    }
    eval { require Digest::Groestl } or croak('Missing Digest::Groestl');
    my $hash = Digest::Groestl->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub hamsi {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak('__PACKAGE__ ::Hamsi: Missing required paramaters');
    }
    eval { require Digest::Hamsi } or croak('Missing Digest::Hamsi');
    my $hash = Digest::Hamsi->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub jh {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::JH: Missing required paramaters' );
    }
    eval { require Digest::JH } or croak('Missing Digest::JH');
    my $hash = Digest::JH->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub keccak {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::Keccak: Missing required paramaters' );
    }
    eval { require Digest::Keccak } or croak('Missing Digest::Keccak');
    my $hash = Digest::Keccak->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub luffa {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::Luffa: Missing required paramaters' );
    }
    eval { require Digest::Luffa } or croak('Missing Digest::Luffa');
    my $hash = Digest::Luffa->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub shavite {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::SHAvite: Missing required paramaters' );
    }
    eval { require Digest::SHAvite3 } or croak('Missing Digest::SHAvite3');
    my $hash = Digest::SHAvite3->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub simd {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::SIMD: Missing required paramaters' );
    }
    eval { require Digest::SIMD } or croak('Missing Digest::SIMD');
    my $hash = Digest::SIMD->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub skein {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::skein: Missing required paramaters' );
    }
    eval { require Digest::Skein } or croak('Missing Digest::Skein');
    my $hash = Digest::Skein->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub sha2 {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::SHA2: Missing required paramaters' );
    }
    eval { require Digest::SHA2 } or croak('Missing Digest::SHA2');
    my $hash = Digest::SHA2->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub shabal {
    my ( $self, $size, $data ) = @_;
    if ( ( !$size ) or ( !$data ) ) {
        croak( __PACKAGE__ . '::Shabal: Missing required paramaters' );
    }
    eval { require Digest::Shabal } or croak('Missing Digest::Shabal');
    my $hash = Digest::Shabal->new($size);
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

sub whirlpool {
    my @parv = @_;
    my $data;
    if ( !$parv[1] ) {
        croak( __PACKAGE__ . '::whirlpool: Missing required paramaters' );
    }
    if ( !$parv[2] ) {
        $data = $parv[1];
    }
    else { $data = $parv[2]; }
    eval { require Digest } or croak('Missing Digest');
    my $hash = Digest->new( 'Whirlpool' );
    $hash->add($data);
    my $out = {
        bin  => $hash->digest,
        hex  => $hash->hexdigest,
        base => $hash->b64digest
    };
    return $out;
}

1;

__END__
