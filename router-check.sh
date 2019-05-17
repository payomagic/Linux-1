 #!/bin/bash

         ###########################################
         # Router's IP address
         #
         IP_ADDRESS='x.x.x.x'
         #
         # Directory where the log files will be stored
         #
         DIR=/home/user/dir
         ########################################
         # while [ 1 ]; do ./router-check.sh ; sleep 300; done &
         # to repeat peridically 
         #
         ########################################

         if [ ! -e $DIR ]
         then
           mkdir $DIR
         fi

         # Tag specification: mmddhhmm
         DATE=`date +'%m%d'`
         TIME=`date +'%H%M'`
         TAG=$DATE$TIME

         # Collect data from the router
         (echo "user";\
         echo "password";\
         echo "term len 0";\
         echo "show version";\
         echo "show processes cpu";\
          echo "show processes cpu history";\
          echo "show processes cpu sorted | ex 0.00";\
         echo "term len 15";\
         echo "show memory summary";\
         echo "q";\
         sleep 30)|telnet $IP_ADDRESS > $DIR/info.$TAG 2>$DIR/info.$TAG.msg
