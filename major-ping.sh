#!/bin/bash
#
#
HMSTORES=~/.major/all-sites.txt

echo "H&M Major Ping script - ver.: 0.01/19 "
echo "======================================"
echo

if [[ ! -f ${HMSTORES} ]]; then
   echo "Processing...! You run this script first time - be patient! Creating H&M site list..."
   mkdir ~/.major || { echo 'Could not create directory!' >&2; exit 1; }
   cinfo henmau- >> ~/.major/all-sites.txt
fi

read -p "Enter country code ( us, kr, gb ): " country
echo
echo "Please be patient..."
cat ~/.major/all-sites.txt | grep henmau-$country >> ~/.major/output2.txt && cat ~/.major/output2.txt | grep Router >> ~/.major/output3.txt \
&& cp ~/.major/output3.txt ~/pinglist && ~/major-ping.pl
echo
cat ping-output
