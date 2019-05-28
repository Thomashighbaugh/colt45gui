# colt45: AutoInstaller

![alt text](https://raw.githubusercontent.com/parnurzeal/gorequest/gh-pages/images/Gopher_GoRequest_400x300.jpg "colt45: Get Some")
---
## Introduction
This is the autoinstaller based on the packages available in the colt45 GUI installer. Unlike the parent script, this is meant to be run without any input from the user with remote systems being accessed by ssh in mind. This script is used to quickly add some basics to a VM or Hypervisor based on Ubuntu Server for the same reason the checkbox system is used in the parent script, namely my bad memory. 

## Use 
To run this script, download the repo, change to the autoinstaller directory, make it executible and run it. 
```
sudo -s 

# git clone https://github.com/Thomashighbaugh/colt45gui

# cd colt45gui/autoinstaller

# chmod +x autoinstaller.sh 

# bash autoinstaller 
```
Then to clean up your system (assuming your pwd is the autoinstaller directory)

``` 
 # cd ..
 
 # cd ..
 
 # rm -r colt45gui
 ```
 
 Then you have some basic tools for getting your system going and running some VMs over ssh. 
