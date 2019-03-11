
# enable color support of ls and also add handy aliases
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
# some more ls aliases
#alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
###.###.###.### #.#.#.#.#.#.# #.#.#.#.#.#.# #.#.#.#.#.#.#

alias wget1='wget -r -nH -nd -np -R index.html* '
alias bashedit='sudo nano /home/administrator/.bashrc'
alias ll='sudo ls -laAfhrnts --color=auto'
alias ccat='pygmentize -g -O bg=dark,style=colorful'
alias cats='highlight -O ansi'
alias la='sudo ls -Alaf'
alias l='sudo ls -CF'
alias cat='sudo cat '
alias taalk='sudo tcpdump -tnn -c 40 -i any | uniq -c | sort -nr | head -10'
alias log='cd /var/log'
alias myip='echo Verejna PUBLIC IP && sudo curl http://checkip.amazonaws.com'
alias publicip='echo PUBLIC IP && sudo curl http://checkip.amazonaws.com'
alias pocasi='echo POCASI && (curl http://wttr.in/ostrava; curl http://wttr.in/le-havre; curl http://wttr.in/dolni-lutyne; curl http://wttr.in/rymarov)'
alias pico='echo System Startup TIME, press Q to finish || systemd-analyze blame && systemd-analyze time && echo Time to System Startup'
#alias whatip='curl http://checkip.amazonaws.com'
alias port='echo Open Ports && netstat -tulap'
alias ports='echo Open Ports && echo ***press Q to finish*** && netstat -tulanp'
alias update='echo UPDATE+UPGRADE && sudo apt -o Acquire::ForceIPv4=true update && sudo apt upgrade -o Acquire::ForceIPv4=true'
#alias termmon='echo Press CTRL+D to finish or type exit && script my.terminal.session'
alias meminfo='free -m -l -t'
alias psmem='echo ***EAT MOST OF RAM*** && ps auxf | sort -nr -k 4 && echo ***TOP TEN BELOW*** && ps auxf | sort -nr -k 4 | head -10'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='echo ***LIST CPU INFO*** && lscpu'
alias cpuinfo2='less /proc/cpuinfo' ##
#alias gpumeminfo='cat /var/log/Xorg.0.log'
#alias httpstat='python /home/netmag/httpstat.py'
alias oldkernel='sudo ls -lh /boot'
alias sizetop10='sudo du -sk * | sort -nr | head -10'
alias temp='sudo du -sh /var/tmp/'
alias size='sudo find / -type f -size +1024k'
alias size2='sudo find / -size +50000  -exec ls -lahg {} \;'
alias trash='rm -r ~/.local/share/Trash/info/ && rm -r ~/.local/share/Trash/files/'
alias logsize='sudo du -h /var/log'
alias ytb-avi='youtube-dl -o "%(title)s.%(ext)s" --write-description --print-traffic --restrict-filenames --recode-video avi'
#.#
alias fulltext='grep -ri '
###.###.###.### #.#.#.#.#.#.# #.#.#.#.#.#.# #.#.#.#.#.#.#
#.#.#.#.#.#.#                   #.#.#.#.#.#.#
#.#.#.#.#.#.# FIREWALL Shortcuts #.#.#.#.#.#.#
#.#.#.#.#.#.#                   #.#.#.#.#.#.#
###.###.###.### #.#.#.#.#.#.# #.#.#.#.#.#.# #.#.#.#.#.#.#
#.#
alias fw='echo ***Firewall RULES, to add write sudo iptables + copy one of the lines, change as needed*** && sudo iptables -S'
alias fw6='sudo /sbin/ip6tables -S'
alias fwlist='echo "FW rules NUMBERED, use sudo iptables -D chainname rulenumber to delete rule" && sudo /sbin/iptables -L -n -v --line-numbers'
alias fw6list='sudo /sbin/ip6tables -L -n -v --line-numbers'
alias fwlsin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias fwlsout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias fwlsfwd='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=fw
alias fw6lsin='sudo /sbin/ip6tables -L INPUT -n -v --line-numbers'
alias fw6lsout='sudo /sbin/ip6tables -L OUTPUT -n -v --line-numbers'
alias fw6lsfwd='sudo /sbin/ip6tables -L FORWARD -n -v --line-numbers'
alias firewall6=fw6
alias fwsave='echo Save FireWall rules && sudo netfilter-persistent save && echo Manually copy above to /etc/iptables/rules.v4'
alias fwload='echo Loads FireWall rules from /etc/iptables/rules.v4 && sudo iptables-restore /etc/iptables/rules.v4'
alias fwapply='echo Apply FireWall rules added && sudo iptables-apply /etc/iptables/rules.v4'
alias fw6save='echo Save FireWall6 rules && sudo netfilter-persistent save && echo manually copy to /etc/iptables/rules.v6 exit'
alias fw6load='echo Load FireWall6 rules saved in /etc/iptables/rules.v6/ && sudo ip6tables-restore /etc/iptables/rules.v6'
alias fw6apply='echo Apply FireWall rules && sudo ip6tables-apply /etc/iptables/rules.v6'
#alias nepritel='sudo /usr/local/bin/addenemy '
#.#.#.#.#.#.#
alias fwedit='sudo nano /etc/iptables/rules.v4'
alias fw6edit='sudo nano /etc/iptables/rules.v6'
#.#.#.#.#.#.#
###.###.###.### #.#.#.#.#.#.# #.#.#.#.#.#.# #.#.#.#.#.#.#
###.###.###.### #.#.#.#.#.#.# #.#.#.#.#.#.# #.#.#.#.#.#.#
###.###.###.### #.#.#.#.#.#.# #.#.#.#.#.#.# #.#.#.#.#.#.#
#.#.#.#.#.#.#
#.#.#.#.#.#.#
alias install='sudo apt -o Acquire::ForceIPv4=true install'
alias apt-search='sudo apt -o Acquire::ForceIPv4=true search'
alias untarg='echo **just add the file | using tar -xvzf** & tar -xzvf '
#.#.#.#.#.#.#
#alias CISCO='sudo docker exec -i -t frr /usr/bin/vtysh'
alias sh.bgp.sum='sudo frr.vtysh -c "sh ip bgp sum" -c "sh ip bgp nei 172.16.22.22 adv" -c "sh ip bgp" -E'
alias sh.route='sudo frr.vtysh -c "sh ip route" -c "sh ip route bgp" -c "sh ip bgp" -E'
#.#.#.#.#.#.#
alias ipfilt='grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" '
#.#.#.#.#.#.#
#alias CIS='sudo frr.vtysh'
#alias ipsec-edit='sudo nano /usr/local/etc/ipsec.conf'
#alias frr.docker='sudo docker exec -i -t frr /usr/bin/vtysh'
#alias vpn-serv='sudo docker exec -i -t ipsec-vpn-server /bin/bash'
#.#
alias whatip="dig @ns1.google.com -t txt o-o.myaddr.l.google.com +short -4 | sed 's/|//g'"
#.#.#.#.#.#.#
alias opevas-passwd='echo "To reset password Use command :: openvasmd --user=admin --new-password= " '
#.#.#.#.#.#.#
alias dynlab='sudo /home/administrator/startlab.sh'
alias vxr1='telnet localhost 2010'
alias vxr2='telnet localhost 2011'
alias dummy-bridge='sudo /home/administrator/dummy-bridge'
alias dummy-bridge-stop='sudo /home/administrator/dummy-bridge-stop'
alias mac-gen='/home/administrator/mac_generate.sh && echo see the ~/cisco-OUI-MAC.txt for valid Cisco OUI'
###.###.###.### #.#.#.#.#.#.# #.#.#.#.#.#.# #.#.#.#.#.#.#
#.#
#.#.#.#.#.#.# SSH-Neighbors aliases #.#.#.#.#.#.#
#.#.#.#.#.#.#                           #.#.#.#.#.#.#
alias wedos-pub='ssh -l administrator -p 5622 31.31.73.128'
alias wedos='ssh -X -l administrator -p 5622 172.16.254.1'
alias wedos2='ssh -X -l administrator -p 5622 172.16.253.3'
alias wedos2-pub='ssh -l administrator -p 5622 31.31.75.17'
alias rpidva='ssh -X -l administrator -p 5622 10.11.10.222'
alias ryzen='ssh -X -l administrator -p 5622 10.11.10.8'
#.#
###.###.###.### #.#.#.#.#.#.# #.#.#.#.#.#.# #.#.#.#.#.#.#
#.#.#.#.#.#.#
#.#.#.#.#.#.#
alias vpn-start='sudo openvpn --config /etc/openvpn/gwdoma.conf --persist-tun --fast-io --up-restart --daemon openvpn-gwdoma'
#.
alias guibootplz='sudo systemctl set-default graphical.target'
#.
alias ip2hex='printf "%02x%02x%02x%02x\n" 10 0 2 217'
#.
alias mssping='ping -Mdo -c3 -s1452 1.1.1.1'
#.#
alias lxc.show-images='sudo lxc image list images:'
#.#.#.#.#
