#!/bin/bash
set -ve
lxc-create -n vpn -t ubuntu

# ln -s /var/lib/lxc/vpn/config /etc/lxc/auto/vpn.conf
perl -i -ple 's/#lxc.aa_profile = unconfined/lxc.aa_profile = unconfined/' /etc/lxc/auto/vpn.conf

perl -i -ple 's/^exit 0/# exit 0/' /etc/rc.local
cat >>/etc/rc.local  <<hello
mkdir -p /var/lib/lxc/vpn/rootfs/dev/net/
mknod -m 666 /var/lib/lxc/vpn/rootfs/dev/net/tun  c 10 200
hello

sh /etc/rc.local


lxc-start -n vpn -d


export IP=####IP#####
iptables -t nat -A PREROUTING -p tcp --dport 1194 -j DNAT --to-destination $IP:1194
iptables -A FORWARD -m state -p tcp -d $IP --dport 1194 --state NEW,ESTABLISHED,RELATED -j ACCEPT




sleep 10
lxc-console -n vpn # ubuntu:ubuntu
sudo su - # ubuntu:ubuntu
apt-get update && apt-get upgrade -y && apt-get install -y openvpn openssl iptables iptables-persistent

echo 'net.ipv4.ip_forward=1' > /etc/sysctl.d/20-openvpn.conf
sysctl -p /etc/sysctl.d/20-openvpn.conf

##### RESTART CONTAINER FROM HOST: lxc-stop -n vpn && lxc-start -d -n vpn #######

lxc-console -n vpn
sudo su -


echo 'net.ipv4.ip_forward=1' > /etc/sysctl.d/20-openvpn.conf
sysctl -p /etc/sysctl.d/20-openvpn.conf


mkdir /etc/openvpn/easy-rsa/ 
cp -R /usr/share/doc/openvpn/examples/easy-rsa/2.0/* /etc/openvpn/easy-rsa/ 

cd /etc/openvpn/easy-rsa/
chown -R root:root .
chmod g+w .
source ./vars
./clean-all
./build-dh
ln -s openssl-1.0.0.cnf openssl.cnf
./pkitool --initca
./pkitool --server server
cd keys
openvpn --genkey --secret ta.key
cp server.crt server.key ca.crt dh1024.pem ta.key ../../

mkdir -p /usr/share/openssl-blacklist/
touch /usr/share/openssl-blacklist/blacklist.RSA-4096


export IP=$(ip  -f inet addr show eth0 | perl -nle '/inet ([0-9.]+)/ and print $1')
echo Your IP is: $IP

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $IP


cat > /etc/openvpn/server.conf <<hello
mode server
port 1194
proto tcp
dev tap
persist-key
persist-tun
#certificates and encryption
ca ca.crt
cert server.crt
key server.key  # This file should be kept secret
dh dh1024.pem
tls-auth ta.key 0 # This file is secret
cipher BF-CBC        # Blowfish (default)
comp-lzo
#DHCP Information
ifconfig-pool-persist ipp.txt
server 10.81.0.1 255.255.0.0
#push "dhcp-option DNS your.dns.ip.here"
#push "dhcp-option DOMAIN yourdomain.com"
#max-clients 1000
user nobody
group nogroup
keepalive 10 120
status openvpn-status.log
verb 3
hello

/etc/init.d/openvpn restart

grep ovpn-server /var/log/syslog | tail -n 100


#### NEW CLIENT ####

export NAME=###CLIENT_LOGIN###

cd /etc/openvpn/easy-rsa/
source ./vars
./pkitool $NAME
