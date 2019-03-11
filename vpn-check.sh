#!/bin/bash
FOUND=`grep "tun0:" /proc/net/dev`
if  [ -n "$FOUND" ] ; then
echo "It exists!"
else
echo "VPN down. Establishing connection..." && /usr/sbin/vpn-establish
fi
