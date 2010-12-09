package Chakora::Protocol;

use strict;
use warnings;
use Carp qw(croak cluck);
use Chakora qw(snd config);


our %PROTOINFO = (
	name => 'Charybdis',
	uses_uids => 1,
	uses_sids => 1,
);
	
sub link {
	my (%link) = shift;
	
	if (length($link{sid}) != 3) {
		croak("SID length must be 3 characters...\n");
	}
	
	else {
		# link here
	}
	
}

sub create_client {
	my (%client) = shift;
	my $id;
	
	if ($PROTOINFO{uses_sids)) {
		$id = config('link/sid');
	}
	
	else {
		$id = config('link/name');
	}
	
	# verify all required fields are provided.
	# make uid
	# create
	
}