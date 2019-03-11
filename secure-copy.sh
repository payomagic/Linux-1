#!/bin/bash

while true; do
   rsync --progress --partial --append -avz -e "ssh -p 5622 " user@172.16.253.1:/home/user/files/* files/
   if [ "$?" = "0" ] ; then
      echo "rsync completed normally"
      exit
   else
      echo "rsync failure. Retrying in a minute..."
      sleep 60
    fi
done
