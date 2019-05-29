##!/bin/bash
# script to get from user a column number
# and file to be filtered

read -p "Column number needed : " foo
echo
read -p "File to be grepped : " oof
echo
echo "============================="
echo "Here is the command needed :: " && echo "awk '{ print \$$foo }' $oof"
echo
echo "============================="
echo
echo "Here is the command output : " && awk '{ print $'$foo' }' $oof
