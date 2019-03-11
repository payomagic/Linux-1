#/bin/sh
echo "Below MAC address is generated completely by random"
echo ""
printf '%02X-%02X-%02X-%02X-%02X-%02X\n' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256]
echo ""
#or you can use the part of MAC and generate the rest
#below MAC starts with OUI of CISCO vendor
echo "below MAC address is generated with 0014.f2 - CISCO OUI"
echo ""
printf '00-14-F2-%02X-%02X-%02X\n' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256]
echo ""
