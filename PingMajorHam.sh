#!/bin/bash
# H&M Major Outage Country ping
# 2019 payomagic
#
# Ver.: 1.03 
#
HMSTORES=~/.major/all-sites.txt

if [[ ! -f ${HMSTORES} ]]; then
   echo "Processing...! In case you run this script first time - re-run it again to ping sites properly!"
   mkdir ~/.major
   cinfo henmau- >> ~/.major/all-sites.txt
fi

#mkdir ~/.major
#cinfo henmau- >> ~/.major/all-sites.txt
read -p "Enter country code ( us, kr, gb ): " country
echo
echo "Please be patient..."
cat ~/.major/all-sites.txt | grep henmau-$country >> ~/.major/output2.txt && cat ~/.major/output2.txt | grep Router >> ~/.major/output3.txt && touch ~/major-ping && /bin/awk '{ print $'1' }' ~/.major/output3.txt >> ~/major-ping && awk '{print "pping "$0" "}' ~/major-ping >> ~/list2ping && chmod +x ~/list2ping && ~/list2ping >> ~/major-list
echo "All sites in chosen country with Router status : "
echo
echo "===== Country Chosen : $country ====="
cat ~/major-list
echo
echo "====================================="
echo
rm ~/.major/output*
rm ~/major-ping
rm ~/list2ping
rm ~/major-list
