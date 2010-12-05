# nickserv/resetpass by The Chakora Project. Allows a service operator to reset an accounts password.
#
# Copyright (c) 2010 The Chakora Project. All rights reserved.
# This software is free software; rights to this code are stated in docs/LICENSE.
use strict;
use warnings;

module_init("nickserv/resetpass", "The Chakora Project", "0.1", \&init_ns_resetpass, \&void_ns_resetpass);

sub init_ns_resetpass {
        if (!module_exists("nickserv/main")) {
                module_load("nickserv/main");
        }
        cmd_add("nickserv/resetpass", "Resets an accounts password.", "RESETPASS will forcefully change an accounts password to a randomly genereated password", \&svs_ns_resetpass);
}

sub void_ns_resetpass {
        delete_sub 'init_ns_resetpass';
        delete_sub 'svs_ns_resetpass';
        cmd_del("nickserv/resetpass");
    delete_sub 'resetpass';
        delete_sub 'void_ns_resetpass';
}

sub svs_ns_resetpass {
        my ($user, @sargv) = @_;

    if (!has_spower($user, "nickserv:manage")) {
        serv_notice("nickserv", $user, "You do not have permission to use RESETPASS.");
        return;
    }
        if (!defined($sargv[1])) {
                serv_notice("nickserv", $user, "Not enough parameters. Syntax: RESETPASS <nickname>");
                return;
        }
        if (!is_registered(1, $sargv[1])) {
                serv_notice("nickserv", $user, "Nickname \002$sargv[1]\002 is not registered.");
            return;
    }
    my $account = $Chakora::DB_nick{lc($sargv[1])}{account};
    resetpass($user, $account);
}

sub resetpass {
    my ( $user, $account ) = @_;
    my $digest = config('enc', 'method');
    my $size = config('enc', 'size');
    my $out;
    $size ||= 512;
    my @char = ('A' .. 'Z', 'a' .. 'z', '0' .. '9');
    my $password = $char[rand@char] . $char[rand@char] . $char[rand@char] . $char[rand@char] . $char[rand@char] . $char[rand@char] . $char[rand@char] . $char[rand@char];
    $out = hash($password);
    $Chakora::DB_account{lc($account)}{pass} = $out;
    serv_notice("nickserv", $user, "Password for ".$account." set to ".$password.".");
    svsilog("nickserv", $user, "RESETPASS", $account);
}
