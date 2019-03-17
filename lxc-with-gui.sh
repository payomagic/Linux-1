#!/bin/bash
cat >>~/lxdguiprofile.txt  <<hello
config:
  environment.DISPLAY: :0
  raw.idmap: both 1000 1000
  security.nesting: "0"
  security.privileged: "0"
  limits.cpu.priority: "5"
  limits.disk.priority: "5"
  limits.memory: 1024MB
  limits.memory.enforce: soft
  limits.memory.swap: "0"
  limits.memory.swap.priority: "5"
  limits.network.priority: "5"
  limits.processes: "500"
  user.user-data: |
    #cloud-config
    runcmd:
      - 'sed -i "s/; enable-shm = yes/enable-shm = no/g" /etc/pulse/client.conf'
      - 'echo export PULSE_SERVER=unix:/tmp/.pulse-native | tee --append /home/ubuntu/.profile'
    packages:
      - x11-apps
      - mesa-utils
      - pulseaudio
description: GUI LXD profile
devices:
  PASocket:
    path: /tmp/.pulse-native
    source: /run/user/1000/pulse/native
    type: disk
  X0:
    path: /tmp/.X11-unix/X0
    source: /tmp/.X11-unix/X0
    type: disk
  mygpu:
    type: gpu
name: gui
used_by:

hello
#Create the profile named "GUI" 
lxc profile create gui
#Fill it with the data needed
cat ~/lxdguiprofile.txt | lxc profile edit gui

lxc profile show gui


#Launch LXC VM Ubuntu 18.04 Bionic with GUI 
##(change GUI profile restrictions above if needed!)
#lxc launch --profile default --profile gui ubuntu:18.04 gui1804
#lxc exec gui1804 -- sudo --user ubuntu --login

#Launch a Firefox app jailed in LXC Ubuntu 18.04 
lxc launch --profile default --profile gui ubuntu:18.04 firefox
lxc exec firefox -- sudo --user ubuntu --login
