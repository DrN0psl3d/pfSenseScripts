#!/bin/sh

# Written by Dr.n0psl3d - v1.0 - @20190126
# Thanks to Mohawkguy
# Get vpnclient interfaces
VPNCLIENTS=`ifconfig | grep 'ovpnc' | grep -v 'inet' | cut -f1 -d ':'`

for CLIENT in $VPNCLIENTS
do
	DATE=`date +%d-%m-%Y-%T`
	VPNGATEWAY=`/sbin/ifconfig $CLIENT | grep 'inet ' | cut -f1 -d '-' | awk '{ print $2}'`
	echo "$DATE : VPN Client [$CLIENT] address: $VPNGATEWAY" >> vpncheck.log
	if [ -z $VPNGATEWAY ] # if this is empty... the vpn is down
	then
		DATE=`date +%d-%m-%Y-%T`
		echo "$DATE : VPN Client [$CLIENT] is down, restarting..." >> vpncheck.log
		CLIENTNUM=`echo $CLIENT | cut -c 6`
		/usr/local/sbin/pfSsh.php playback svc restart openvpn client $CLIENTNUM
	else
		DATE=`date +%d-%m-%Y-%T`
		echo "$DATE : VPN Client [$CLIENT] is up... doing nothing..." >> vpncheck.log
	fi
done
