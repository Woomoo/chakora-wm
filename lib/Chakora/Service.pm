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
#use Chakora qw(snd);
use Protocol qw(client_create client_delete cjoin cpart);

our $VERSION = '0.01';
our (%svshash,$uid);

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
	elsif (!defined($self->{ident})) {
		croak("Error: Please define an ident\n");
	}
	elsif (!defined($self->{mask})) {
		croak("Error: Please define a mask\n");
	}
	elsif (!defined($self->{realname})) {
		croak("Error: Please define a realname\n");
	}
	else {
		%svshash = (
			nick => $self->{nick},
			ident => $self->{ident},
			mask => $self->{mask},
			realname => $self->{realname},
		);
	}
	return $self;
}

=pod

=head2 init

This method connects the created client.

=cut

sub init {
	my $self = shift;
	$self->{uid} = Chakora::Protocol->client_create(%svshash);
	return 1;
}

1;

=pod

=head2 uid

This method returns the created client's UID

=cut

sub uid {
	my $self = shift;
	return $self->{uid};
}

=pod

=head2 nick

This method returns the service's nick.

=cut

sub nick {
        my $self = shift;
	return $self->{nick};
}

=pod

=head2 ident

This method returns the service's ident.

=cut

sub ident {
        my $self = shift;
        return $self->{ident};
}

=pod

=head2 mask

This method returns the service's mask.

=cut

sub mask {
        my $self = shift;
        return $self->{mask};
}

=pod

=head2 realname

This method returns the service's real name.

=cut

sub realname {
        my $self = shift;
        return $self->{realname};
}

=pod

=head2 operonly

This method returns if the service is set to oper only or not.

=cut

sub operonly {
        my $self = shift;
        if ($self->{operonly}) {
		return 1;
	}
	else {
		return 0;
	}
}

=pod

=head2 join

This method makes the created service join a channel

=cut

sub join {
	my ($self, $chan) = shift, shift;
	Chakora::Protocol->cjoin($self->uid, $chan);
	return 1;
}


=pod

=head2 part

This method makes the created service part a channel

=cut

sub part {
	my ($self, $chan, $reason) = shift, shift, shift;
	if (length($reason) = 0) {
		$reason = 'Parting...';
	}
	Chakora::Protocol->cpart($self->uid, $chan, $reason);
	return 1;
}

=pod

=head1 SUPPORT

For support please connect to irc.woomoo.org #dev

=cut

=head1 AUTHORS
See README
=cut

=head1 COPYRIGHT
Copyright 2010 Chakora-wm developers
=cut

