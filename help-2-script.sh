#!/bin/bash

function myHelp () {
# Using a here doc with standard out.
cat <<-END
Usage:
------
   -h | --help
     Display this help
   -n
     Do nothing loudly.
END
}

doNothing=0;
while [ -n "$1" ]; do
    case "$1" in
        -h | --help)
            myHelp
            exit
            ;;
        -n)
            doNothing=1;
            shift
            ;;
    esac 
done 

if [ $doNothing -gt 0 ]; then
    echo -e "****\nDoing nothing!\n****"
fi        
