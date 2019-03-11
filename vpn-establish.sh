#!/bin/bash
/usr/sbin/openvpn --config /etc/openvpn/gwdoma.conf --persist-tun --fast-io --up-restart --daemon openvpn-gwdoma
