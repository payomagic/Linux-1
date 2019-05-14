#!/bin/bash
# Major Outage Ping All Sites in country
#-----------------------------------------
#
HMSTORES=".major/all-sites.txt"
echo "Major Outage script to verify country for H&M sites"
echo "Author : vzid dvorapa 2019"
echo
echo "Verifying if ran in past already ..."

if [[ ! -f ${HMSTORES} ]]; then
   echo "Processing...! In case you run this script first time - re-run it again to ping sites properly!"
   mkdir ~/.major
   cinfo henmau- >> .major/all-sites.txt
   chmod -w .major/all-sites.txt
fi

read -p "Enter country code ( us, kr, gb ): " country
echo
echo "Processing... Please be patient."
cat .major/all-sites.txt | grep henmau-$country >> .major/output2.txt
cat .major/output2.txt | grep Router >> .major/output3.txt
echo "Routers H&M Country List Full"
echo "===================================="
cat .major/output3.txt
echo
echo "All country NeIDs : "
echo
/bin/awk '{ print $'1' }' .major/output3.txt
echo
echo "Now pinging all sites ..."
echo
echo "."
echo
echo ".."
echo
echo "..."
echo
/bin/awk '{ print $'2' }' .major/output3.txt >> Major-IP-List.txt
/bin/awk '{ print $'1' }' .major/output3.txt >> Major-NeID-List.txt

export IPLIST="Major-IP-List.txt"
export NEIDLIST="Major-NeID-List.txt"

if [[ ! -f ${IPLIST} ]]; then
   echo "No File!"
   exit 1
fi

/usr/local/bin/perl major-ping.pl
echo "DONE! Check the ping-list.txt file ;)"
echo
echo "to read it use command :  cat ping-list.txt"
rm .major/output*.txt
echo "----------------------------------------------------"
echo
