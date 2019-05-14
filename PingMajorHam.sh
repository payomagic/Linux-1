#!/bin/bash
#mkdir ~/.major
#cinfo henmau- >> .major/all-sites.txt
read -p "Enter country code ( us, kr, gb ): " country
cat .major/all-sites.txt | grep henmau-$country >> .major/output2.txt && cat .major/output2.txt | grep Router >> .major/output3.txt && touch major-ping && chmod +x major-ping && /bin/awk '{ print $'1' }' .major/output3.txt >> major-ping && awk '{print "pping "$0" "}' major-ping >> list2ping && chmod +x list2ping && ./list2ping >> major-list
