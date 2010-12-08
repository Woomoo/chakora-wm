package Chakora::Service;

=pod

=head1 NAME

Chakora::Service - Service Management

=head1 SYNOPSIS

  my $nickserv = Chakora::Service->new(
      nick  => 'NickServ',
      ident => 'NickServ',
      mask => 'services.int',
      realname => 'Nickname Services',
      operonly => 0,
  );
  
  $nickserv->init;

=head1 DESCRIPTION

This module creates and manages services for Chakora.

=head1 METHODS

=cut

use 5.006;
use strict;
use warnings;
use diagnostics -verbose;
use Carp qw(cluck croak);

our $VERSION = '0.01';

=pod

=head2 new

  my $nickserv = Chakora::Service->new(
      nick  => 'NickServ',
      ident => 'NickServ',
      mask => 'services.int',
      realname => 'Nickname Services',
      operonly => 0,
  );

The C<new> constructor lets you create a new B<Chakora::Service> object.

So no big surprises there...

Returns a new B<Chakora::Service> or dies on error.

=cut

sub new {
	my $class = shift;
	my $self  = bless { @_ }, $class;
	if (!defined($self->{nick})) {
		croak("Error: Please define a nick\n");
	}
	elsif (!defined$self->{ident})) {
		croak("Error: Please define an ident\n");
	}
	elsif (!defined($self->{mask})) {
		croak("Error: Please define a mask\n");
	}
	elsif (!defined($self->{realname})) {
		croak("Error: Please define a realname\n");
	}
	return $self;
}

=pod

=head2 init

This method connects the created client.

=cut

sub init {
	my $self = shift;

	# Connect client here

	return 1;
}

1;

=pod

=head1 SUPPORT

For support please connect to irc.woomoo.org #dev

=head1 AUTHOR

Copyright 2010 Chakora-wm developers

=cut
