# colt45 v3: GUI colt45

Replacing Previous Incarnations of the colt45 Provisioning System is this single script solution. Its a long script, to be sure, but that nonetheless increases the simplicity of the script as no cross file references or terminal-inception logic exists to complicate the functionality of the script (or its maintanence). 


## REQUIREMENTS

- Ubuntu Based Distro Installed on Your System 
  - I use Ubuntu Budgie exclusively now, so the script is designed with it in mind
- Some Idea of What You Want to Use Your System For
- Snap capabilities (optional) - offered as a package in the program but having snapd installed prevents the need from selecting that option. To install snapd:
    ``sudo apt-get install snapd`` 

## USE 

To run the GUI simply download the script (colt45gui.sh) then navigate to the directory 
``git clone https://github.com/Thomashighbaugh/colt45gui
cd ~/Downloads/colt45gui``

Then make it executiable 

`sudo chmod +x colt45gui.sh`

Then run it 

`bash colt45.sh` 

And select the programs you want to install!

## Web Page
With this repository, I have packaged a simple webpage to serve as the face of the program for purposes of my portfolio. It is hosted (here)[https://colt45gui.netlify.com/] and links back to this repository.

## Acknowledgements

- This project was inspired by the _(Alfred Installer)[https://github.com/derkomai/alfred]_, which is a Python script that accomplishes a similar task, albeit with a smaller list of programs (but a killer logo!). The now deprecated shell script was used as a example during the construction of the colt45 application (especially in terms of program logic and filling in details that StackOverflow cannot). I am particularly impressed by the level of accurate comments the developer left that are understandable and explain the functionality of the script.  

- **Thank you** to Ubuntu for breaking often enough to motivate me to write out this monster of a shell script so I don't have to remember all the programs I install on a fresh system or go through the tedious process of individually installing them with apt-get or using synaptic. 

## To Do 
- create snap install function to replace the full command []
- add additional apps useful to others []
- sort the apps by category []
- resize the windows desktop []
