#!/usr/bin/env perl

# Parser.pm - Keldair::Parse IRC parsing
# Copyright 2010 Alexandria Wolcott <alyx@woomoo.org>
# Released under the 3 clause BSD license
# $Id$ $Revision$ $HeadURL$ $Date$ $Source$

package Keldair::Core::Parser;

use strict;
use warnings;
use Carp qw(carp croak);
require Exporter;
use base "Exporter";
our @EXPORT_OK = qw(parse_irc);

our $VERSION = 1.1.0;

sub new {
    my $class = shift;
    my $self = bless {}, $class;
    return $self;
}

sub parse {
    my ( $self, $raw ) = @_;
    if ( $raw =~ /(?:\:([^\s]+)\s)?(\w+)\s(?:([^\s\:]+)\s)?(?:\:?(.*))?$/xsm ) {
        my $event = {
            'raw '    => $raw,
            'origin'  => $1,
            'command' => $2,
            'target'  => $3,
            'params'  => $4,
        };
        if (defined($event->{origin})) {
            if ($event->{origin} =~ /(.*)!(.*)\@(.*)/xsm) {
                $event->{origin} = {
                    'raw' => $event->{origin},
                    'nick' => $1,
                    'user' => $2,
                    'host' => $3
                };
            }
        }
        return $event;
    }
    else {
        carp('Received non-IRC line!');
        return 0;
    }
}

sub parse_irc {
    my @args = @_;
    if ( defined( $args[1] ) ) {
        my $event = __PACKAGE__->parse( $args[1] );
        return $event;
    }
    else {
        my $event = __PACKAGE__->parse( $args[0] );
        return $event;
    }
}

1;


__END__

=head1 NAME

Keldair::Parser - An IRC protocol parser.

=head1 SYNOPSIS

General usage:

  use strict;
  use Keldair::Parser qw(parse_irc);

  # Non-OOP interface

  my $event = parse_irc( $irc_string );

  # OO interface

  my $irc = Keldair::Parser->new();

  my $event = $irc->parse( $irc_string );

=head1 DESCRIPTION

Keldair::Parser provides a very useful way to parse IRC strings (And is used quite successfully in the Keldair IRC bot!)

=head1 FUNCTION INTERFACE

Using the module optionally imports 'parse_irc' into your namespace.

=over

=item C<parse_irc>

Takes a string of IRC protcol text. Returns a hashref on success or undef on failure.
See below for the format of the hashref returned.

=back

=head1 OBJECT INTERFACE

=head2 CONSTRUCTOR

=over

=item C<new>

Creates a new Keldair::Parser object.

=back

=head2 METHODS

=over

=item C<parse>

Takes a string of IRC protcol text. Returns a hashref on success or undef on failure.
The hashref contains the following fields:

  origin (This is a hashref)
    nick
    user (ident)
    host
    raw
  command
  target
  params
  raw

If for some reason the string is lacking one of the above, the field is just undef.

For example:

LINE: ':alexandria!alyx@omg.ponies PRIVMSG #keldair :I love unicorns!'

  HASHREF: {
         origin   => {
            nick => 'alexandria',
            user => 'alyx',
            host => 'omg.ponies',
            raw  => 'alexandria!alyx@omg.ponies'
         },
         command  => 'PRIVMSG',
         target   => '#keldair',
         params   => 'I love unicorns!',
         raw_line => ':alexandria!alyx@omg.ponies PRIVMSG #keldair :I love unicorns!',
       }


=back

=head1 AUTHOR

Alexandria Wolcott <alyx@woomoo.org>

Based on regex by Stephen Belcher <sycobuny@malkier.net>

Documentation based on the documentation of Parse::IRC (By Chris Williams and Jonathan Steinert), which performs a similar task.

=head1 LICENSE

Copyright E<copy> Alexandria Wolcott

This module may be used, modified, and distributed under the same terms as Perl itself. Please see the license that came with your Perl distribution for details.

=head1 SEE ALSO

L<Parse::IRC>

L<http://woomoo.org/~alyx/keldair>

L<http://www.faqs.org/rfcs/rfc1459.html>

L<http://www.faqs.org/rfcs/rfc2812.html>
