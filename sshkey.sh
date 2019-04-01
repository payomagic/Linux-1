#!/bin/sh
#

read -p 'To delete the key for a host add an IP or NeID : ' key
echo "ssh-keygen -R <ip or host>"
echo ""
echo ...running...
ssh-keygen -R $key
