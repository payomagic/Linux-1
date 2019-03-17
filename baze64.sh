#!/bin/bash

read -p "Encode 2 base64 : " encdb64

echo "Here goes b64 crypted :: " && echo $encdb64 | base64
