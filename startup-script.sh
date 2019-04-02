#!/bin/bash
# crontab -e  and paste the startup :::
# @reboot /usr/sbin/startup-script.sh
# */1 * * * * /bin/ping -c1 172.21.0.1 #wireguard workaround for clients

# TBD !!!
# # /etc/crontab: system-wide crontab
# Unlike any other crontab you don't have to run the `crontab'
# command to install the new version when you edit this file
# and files in /etc/cron.d. These files also have username fields,
# that none of the other crontabs do.

#SHELL=/bin/sh
#PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
# TBD!!!

/usr/sbin/openvpn --config /etc/openvpn/client.conf --persist-tun --fast-io --up-restart --daemon openvpn-wedos2
#.#
/sbin/ip addr replace <static> dev eth0
/sbin/ifconfig eth0 up
#.#.#.# KNOCKING Opening of ports #.#.#>#
/usr/sbin/knockd -d -c /home/administrator/knockd.conf
#.#.#.##.#.#.##.#.#.#
# IP ROUTE add
/sbin/ip route replace <home> via <dc> dev eth0 onlink
/sbin/ip route replace default via <dc> dev eth0 onlink
#.#.#.##.#.#.##.#.#.#
#.# TAP Interfaces
#.#.#.##.#.#.##.#.#.#
/usr/sbin/tunctl -t tap0 && /sbin/ifconfig tap0 172.22.22.23 netmask 255.255.255.0 up
/usr/sbin/tunctl -t tap1 && /sbin/ifconfig tap1 10.11.8.253 netmask 255.255.255.248 up
/sbin/ip addr add 172.16.252.5/32 dev tap0
/sbin/ifconfig tap0 up
#.#.#.##.#.#.##.#.#.#
#.# GNS3 server
#.#.#.##.#.#.##.#.#.#
/usr/bin/gns3server --host 172.16.253.3 --port 3080 --ssl --daemon
#.#
exit
