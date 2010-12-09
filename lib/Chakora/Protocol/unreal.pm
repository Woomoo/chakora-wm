package Chakora::Protocol;

use strict;
use warnings;
use Carp qw(croak cluck);
use Chakora qw(snd config);


our %PROTOINFO = (
	name => 'UnrealIRCd',
	uses_uids => 0,
	uses_sids => 0,
);
	
sub link {
	my (%link) = shift;

	#link here
	
}

sub create_client {
	my (%client) = shift;
	
	# verify all required fields are provided.
	# create
	
}