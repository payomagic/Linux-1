#fix for locale issues when connecting to ubuntu servers
export LANG="en_US.utf8"
export LANGUAGE="en_US.utf8"
export LC_ALL="en_US.utf8"
echo 'LANGUAGE="en_US.UTF-8"' >> /etc/default/locale
echo 'LC_ALL="en_US.UTF-8"' >> /etc/default/locale

#a) login as a root user (sudo -u root -i) and run the echo commands as root user.
#b) sudo mcedit /etc/default/locale
#and then paste:

#LANGUAGE="en_US.UTF-8"
#LC_ALL="en_US.UTF-8"

