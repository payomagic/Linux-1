
## IPSEC / L2TP VPN ports and protocols + IPtables rules

    + Protocol: UDP, port 500 (for IKE, to manage encryption keys)
    + Protocol: UDP, port 4500 (for IPSEC NAT-Traversal mode)
    + Protocol: ESP, value 50 (for IPSEC)
    + Protocol: AH, value 51 (for IPSEC)

	Port 1701 is used by the L2TP Server, 
	but connections should not be allowed inbound to it from outside. 
	
	There is a special firewall rule to allow only IPSEC secured traffic inbound on this port.

	If using IPTABLES, and your L2TP server sits directly on the internet, then the rules you need are
		==============================================================
```
iptables -A INPUT -i eth0 -p udp --dport 500 -j ACCEPT
	iptables -A INPUT -i eth0 -p udp --dport 4500 -j ACCEPT
	iptables -A INPUT -i eth0 -p 50 -j ACCEPT
	iptables -A INPUT -i eth0 -p 51 -j ACCEPT
	iptables -A INPUT -i eth0 -p udp -m policy --dir in --pol ipsec -m udp --dport 1701 -j ACCEPT
```

IKE
```
iptables -A INPUT -p udp -m state --state NEW -m udp --dport 500 -j ACCEPT
```
NAT-T
```
iptables -A INPUT -p udp -m state --state NEW -m udp --dport 4500 -j ACCEPT
```
ESP
```
iptables -A INPUT -p esp -j ACCEPT
```
AH
```
iptables -A INPUT -p ah -j ACCEPT
```
  ==============================================================
	
### IPSEC Check - tcpdump rule

```	
  tcpdump -n -i gre1 esp or udp port 500 or udp port 4500
	/usr/sbin/tcpdump -n -i tap0 esp or udp port 500 or udp port 4500
```

###	GRE Tunnel - Linux
```
iptunnel add gre1 mode gre local 1.2.3.4 remote 4.3.2.1_IP ttl 255
ip addr add 192.168.168.1/30 dev gre1
ip link set gre1 up	
```
```
lsmod | grep ip_gre > /dev/null
if [ $? -eq 1 ]; then
    modprobe ip_gre
		# for CentOS only>>>> 
		#echo 'ip_gre' >> /etc/modules-load.d/gre.conf 
fi
```

### IP Forwarding
	
```
	net.ipv4.conf.all.forwarding = 1
net.ipv4.conf.default.forwarding = 1
net.ipv4.ip_forward = 1

sysctl -p --system will apply these rules
```



###	Allow NAT between network
	
```
iptables -t nat -A POSTROUTING -o gre1 -j ACCEPT
iptables -A INPUT -p gre -j ACCEPT
```
	
routing policy to go through GRE tunnel 
	Example: route all Google DNS traffic to GRE:
```
ip route add 8.8.0.0/16 dev gre1
```
	 add the rules to /etc/rc.local if you want to have persistent routing 	
	
