package Chakora::Core::SIG;
use strict;
use warnings;

require Exporter;
use base 'Exporter';
our @EXPORT_OK = qw(TERM_handler INT_handler);

sub TERM_handler {
    logchan( "operserv", "Exiting on SIGTERM." );
    svsflog( "chakora", "Exiting on SIGTERM" );
    if ( module_exists("chanserv/main") ) {
        serv_quit( "chanserv", "Shutting down" );
    }
    serv_squit( config( 'me', 'sid' ), "Caught SIGTERM" );
    dbflush();
    sleep 1;
    exit(0);
}

sub INT_handler {
    logchan( "operserv", "Exiting on SIGINT." );
    svsflog( "chakora", "Exiting on SIGINT" );
    if ( module_exists("chanserv/main") ) {
        serv_quit( "chanserv", "Shutting down" );
    }
    serv_squit( config( 'me', 'sid' ), "Caught SIGINT" );
    dbflush();
    if ($Chakora::debug) { idflush(); }
    sleep 1;
    exit(0);
}


1;
