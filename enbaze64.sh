#!/bin/bash
read -p "Decode from base64 : " dcdb64

echo "Here goes decrypted :: "  && echo $dcdb64 | base64 -d
