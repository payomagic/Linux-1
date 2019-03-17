#!/bin/bash
sudo add-apt-repository universe
sudo apt-get install git python3-pip
git clone https://www.github.com/threat9/routersploit
cd routersploit
python3 -m pip install setuptools
python3 -m pip install -r requirements.txt
python3 rsf.py
