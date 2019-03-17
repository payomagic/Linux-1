#!/bin/bash

read -p "Website FQDN/IP to be cloned : " web2clone
mkdir ~/$web2clone && cd ~/$web2clone
wget -r -nH $web2clone

