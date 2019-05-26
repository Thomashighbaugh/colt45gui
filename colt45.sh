#!/usr/bin/env bash
echo "########################################################################"
echo "Author: Thomas Leon Highbaugh"
echo "colt45 Auto Installer for"
echo "Ubuntu Based Systems"
echo "########################################################################"
echo "This software is Free to Use With Attribution in any context." 
echo "It comes with no guarentee of anything except that if you are reading this you are a complete nerd or paranoid (or maybe both)"
echo "########################################################################"
# INITIALIZATION ##############################################################
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
set -o xtrace

debug=true

updateSystem=false
packages=""
repos=()
taskNames=()
taskMessages=()
taskDescriptions=()
taskRecipes=()
taskPostInstallations=()
taskSelectedList=()


# TASK LIST ###################################################################
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

taskNames+=("Update system and add extra Ubuntu repos")
taskMessages+=("Updating system")
taskDescriptions+=("Add additional repos and install the latest version of all your software")
taskRecipes+=("updateSystem")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

updateSystem()
{
  addRepo "multiverse universe restricted"
  updateSystem=true

}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install automatic drivers and package managers")
taskMessages+=("Processing drivers")
taskDescriptions+=("Install drivers, extra package managers like Snap/Flatpak and package manager GUIs")
taskPostInstallations+=("")
taskRecipes+=("autoInstallDrivers")
taskSelectedList+=("FALSE")

autoInstallDrivers()
{
  ubuntu-drivers autoinstall
  addPackage "gnome-packagekit"
  addPackage "gnome-packagekit-data"
  addPackage "gstreamer1.0-packagekit"
  addPackage "synaptic"
  addPackage "flatpak"
  addPackage "snapd"
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Java, Flash and codecs")
taskMessages+=("Processing Java, Flash and codecs")
taskDescriptions+=("Install non-open-source packages like Java, Flash plugin, Unrar, and some audio and video codecs like MP3/AVI/MPEG")
taskRecipes+=("installRestrictedExtras")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installRestrictedExtras()
{
  addPackage "ubuntu-restricted-extras"
  addPackage "adobe-flashplayer"
}

##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Chromium")
taskMessages+=("Processing Chromium")
taskDescriptions+=("The open-source web browser providing the code for Google Chrome.")
taskRecipes+=("installChromium")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installChromium()
{
sudo snap install --classic chromium
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Firefox")
taskMessages+=("Processing Firefox")
taskDescriptions+=("The web browser from Mozilla")
taskRecipes+=("installFirefox")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installFirefox()
{
sudo snap install --classic firefox
}

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install Cubic")
taskMessages+=("Processing Cubic")
taskDescriptions+=("Create Custom Live USBs")
taskRecipes+=("installCubic")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installCubic()
{
  addRepo "ppa:cubic-wizard/release"
  addPackage "cubic"
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------

taskNames+=("Install Opera")
taskMessages+=("Processing Opera")
taskDescriptions+=("Just another web browser")
taskRecipes+=("installOpera")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installOpera()
{
sudo snap install --classic opera
}

##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Transmission")
taskMessages+=("Processing Transmission")
taskDescriptions+=("A light bittorrent download client")
taskRecipes+=("installTransmission")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installTransmission()
{

  addPackage "transmission-gtk"
}

##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install VirtualBox")
taskMessages+=("Processing VirtualBox")
taskDescriptions+=("A virtualization software to run other OSes on top of your current OS")
taskRecipes+=("installVirtualBox")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installVirtualBox()
{
  addPackage "virtualbox virtualbox-qt virtualbox-ext-pack virtualbox-dkms virtualbox-guest-utils virtualbox-guest-x11 virtualbox-guest-source"
}

##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Thunderbird")
taskMessages+=("Processing Thunderbird")
taskDescriptions+=("A mail client from Mozilla")
taskRecipes+=("installThunderbird")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installThunderbird()
{
  addPackage "thunderbird"
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Telegram")
taskMessages+=("Processing Telegram")
taskDescriptions+=("A chat client, similar to Whatsapp, Viber, Facebook Messenger or Google Hangouts")
taskRecipes+=("installTelegram")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installTelegram()
{
sudo snap install telegram-desktop
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Slack")
taskMessages+=("Processing Slack")
taskDescriptions+=("A team communication application")
taskRecipes+=("installSlack")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installSlack()
{
sudo snap install slack --classic
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install VLC")
taskMessages+=("Processing VLC")
taskDescriptions+=("The most famous multimedia player")
taskRecipes+=("installVLC")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installVLC()
{
sudo snap install vlc

}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Handbrake")
taskMessages+=("Processing Handbrake")
taskDescriptions+=("A video transcoder")
taskRecipes+=("installHandbrake")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installHandbrake()
{
sudo snap install handbrake-jz
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Spotify")
taskMessages+=("Processing Spotify...")
taskDescriptions+=("One of the best music streaming apps")
taskRecipes+=("installSpotify")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installSpotify()
{
 sudo snap install spotify
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Audacity")
taskMessages+=("Processing Audacity")
taskDescriptions+=("Record and edit audio files")
taskRecipes+=("installAudacity")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installAudacity()
{
sudo snap install audacity
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Soundconverter")
taskMessages+=("Processing Soundconverter")
taskDescriptions+=("Audio file converter")
taskRecipes+=("installSoundconverter")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installSoundconverter()
{
  addPackage "soundconverter"
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Transitions DJ")
taskMessages+=("Processing Transitions DJ")
taskDescriptions+=("Music Mixing App for Live DJing and mixtape production")
taskRecipes+=("installTransitionsDJ")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installTransitionsDJ()
{
sudo snap install transitionsdj
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install LMMS")
taskMessages+=("Processing LMMS")
taskDescriptions+=("Music production for everyone: loops, synthesizers, mixer...")
taskRecipes+=("installLMMS")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installLMMS()
{
  addPackage "lmms"
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Gimp")
taskMessages+=("Processing Gimp")
taskDescriptions+=("Gimp is an image editor")
taskRecipes+=("installGimp")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installGimp()
{
  addPackage "gimp"
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Inkscape")
taskMessages+=("Processing Inkscape")
taskDescriptions+=("Create and edit scalable vectorial images")
taskRecipes+=("installInkscape")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installInkscape()
{
  addPackage "inkscape"
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Blender")
taskMessages+=("Processing Blender")
taskDescriptions+=("3D modelling, animation, rendering and production")
taskRecipes+=("installBlender")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installBlender()
{
sudo snap install blender --classic
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------


taskNames+=("Install Evince")
taskMessages+=("Processing Evince")
taskDescriptions+=("A document viewer with support for PDF, Postscript, djvu, tiff, dvi, XPS and SyncTex")
taskRecipes+=("installEvince")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installEvince()
{
  addPackage "evince"
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
installDiffPdf()
{
  addPackage "diffpdf"
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Steam")
taskMessages+=("Processing Steam")
taskDescriptions+=("A game digital distribution platform developed by Valve")
taskRecipes+=("installSteam")
taskPostInstallations+=("postSteam")
taskSelectedList+=("FALSE")

installSteam()
{

  addPackage "steam"
}

postSteam()
{
  cd "$HOME"/.steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu
  mv libstdc++.so.6 libstdc++.so.6.bak
  cd "$HOME"/.steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu
  mv libstdc++.so.6 libstdc++.so.6.bak
}

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install Wine")
taskMessages+=("Processing Wine")
taskDescriptions+=("A tool to install Windows software on Linux")
taskRecipes+=("installWine")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installWine()
{
sudo snap install wine-platform
  addPackage "winetricks"
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install PlayOnLinux")
taskMessages+=("Processing PlayOnLinux")
taskDescriptions+=("A tool to install Windows games on Linux")
taskRecipes+=("installPlayOnLinux")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installPlayOnLinux()
{
  addPackage "playonlinux"
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

taskNames+=("Install Disk utility")
taskMessages+=("Processing Disk utility")
taskDescriptions+=("A tool to manage your drives")
taskRecipes+=("installDiskUtility")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installDiskUtility()
{
  addPackage "gnome-disk-utility"
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

taskNames+=("Install GParted")
taskMessages+=("Processing GParted")
taskDescriptions+=("A tool to make partitions in your hard drives")
taskRecipes+=("installGParted")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installGParted()
{
  addPackage "gparted"
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

taskNames+=("Install MenuLibre")
taskMessages+=("Processing MenuLibre")
taskDescriptions+=("Add or remove applications from your menu")
taskRecipes+=("installMenuLibre")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installMenuLibre()
{
  addPackage "menulibre"
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install Seahorse")
taskMessages+=("Processing Seahorse")
taskDescriptions+=("Manage your passwords")
taskRecipes+=("installSeahorse")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installSeahorse()
{
  addPackage "seahorse"
}
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install BitWarden")
taskMessages+=("Processing BitWarden")
taskDescriptions+=("Manage your passwords")
taskRecipes+=("installBitwarden")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installBitwarden()
{
  sudo snap install bitwarden 
}
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Duplicity")
taskMessages+=("Processing Duplicity")
taskDescriptions+=("Keep your files safe by making automatic backups")
taskRecipes+=("installDuplicity")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installDuplicity()
{
  addPackage "duplicity"
}
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install UNetbootin")
taskMessages+=("Processing UNetbootin")
taskDescriptions+=("Tool for creating Live USB drives")
taskRecipes+=("installUNetbootin")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installUNetbootin()
{
  addPackage "unetbootin"
}
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install FileZilla")
taskMessages+=("Processing FileZilla")
taskDescriptions+=("Download and upload files via FTP, FTPS and SFTP")
taskRecipes+=("installFileZilla")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installFileZilla()
{
  addPackage "filezilla"
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install utilities bundle")
taskMessages+=("Processing utilities bundle")
taskDescriptions+=("Java, zip, rar and exfat tools")
taskRecipes+=("installUtilities")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installUtilities()
{
  addPackage "icedtea-8-plugin" 
  addPackage "openjdk-8-jre" 
  addPackage "p7zip" 
  addPackage "rar" 
  addPackage "exfat-fuse" 
  addPackage "exfat-utils" 
  addPackage "unzip" 
  addPackage "rzip" 
  addPackage "wzip" 
  addPackage "ziptool" 
  addPackage "plzip" 
  addPackage "minizip" 
  addPackage "minilzip" 
  addPackage "htop" 
  addPackage "gtk2-engines-pixbuf" 
  addPackage "gtk2-engines-murrine" 
  addPackage "gzip" 
  addPackage "unace" 
  addPackage "unrar-free" 
  addPackage "ntfs-3g" 
  addPackage "ntfs-config" 
  addPackage "libfsntfs1" 
  addPackage "lzip" 
  addPackage "python-avahi"
  addPackage "avahi-autoipd" 
  addPackage "libnet-rendezvous-publish-backend-avahi-perl" 
  addPackage "avahi-autoipd"  
  addPackage "avahi-utils" 
  addPackage "avahi-dnsconfd" 
  addPackage "avahi-ui-utils" 
  addPackage "p7zip-full" 
  addPackage "jlha-utils" 
  addPackage "lzip" 
  addPackage "lunzip" 
  addPackage "bzip2" 
  addPackage "clzip" 
  addPackage "libboost-dev" 
  addPackage "libboost-serialization-dev" 
  addPackage "libboost-filesystem-dev" 
  addPackage "liboost-dev" 
  addPackage "libboost-system-dev"
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install Glipper")
taskMessages+=("Processing Glipper")
taskDescriptions+=("Gnome clipboard manager")
taskRecipes+=("installGlipper")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installGlipper()
{
  addPackage "glipper"
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install developer bundle")
taskMessages+=("Processing developer bundle")
taskDescriptions+=("Tools for developers: build-essential, cmake, git, svn, java, python, octave, autotools...")
taskRecipes+=("installDevBundle")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installDevBundle()
{

addPackage "build-essential" 
addPackage "cmake" 
addPackage "cmake-gui" 
addPackage "cmake-curses-gui" 
addPackage "python" 
addPackage "python3" 
addPackage "octave" 
  addPackage "gfortran" 
  addPackage "git" 
  addPackage "git-svn" 
  addPackage "subversion" 
  addPackage "kdiff3" 
  addPackage "colordiff" 
  addPackage "openjdk-8-jdk" 
  addPackage "autoconf" 
  addPackage "autotools-dev" 
  addPackage "cppcheckpastebinit" 
  addPackage "alacarte" 
  addPackage "autogen" 
  addPackage "shutter" 
  addPackage "cmake" 
  addPackage "git" 
  addPackage "curl" 
  addPackage "gtk2-engines-pixbuf" 
  addPackage "gtk2-engines-murrine" 
  addPackage "gzip" 
  addPackage "unace" 
  addPackage "unrar-free" 
  addPackage "ntfs-3g" 
  addPackage "ntfs-config" 
  addPackage "libfsntfs1" 
  addPackage "ssh" 
  addPackage "python-pip" 
  addPackage "python3-pip" 
  addPackage "browser-plugin-vlc" 
  addPackage "libvlc-bin" 
  addPackage "libvlc5" 
  addPackage "libvlccore9" 
  addPackage "vlc" 
  addPackage "vlc-bin" 
  addPackage "vlc-data" 
  addPackage "vlc-plugin-access-extra" 
  addPackage "vlc-plugin-base"  
  addPackage "vlc-plugin-video-output" 
  addPackage "vlc-plugin-qt" 
  addPackage "gpaste" 
  addPackage "svn2git" 
  addPackage "subversion-tools" 
  addPackage "ssvnc" 
  addPackage "backupninja"
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install Cockpit")
taskMessages+=("Processing Boost")
taskDescriptions+=("Web interface for your system")
taskRecipes+=("installBoost")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")
installCockpit()
{
  addPackage "cockpit-dashboard" 
  addPackage "cockpit-docker" 
  addPackage "cockpit-networkmanager" 
  addPackage "cockpit-packagekit" 
  addPackage "cockpit-bridge" 
  addPackage "cockpit"
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

taskNames+=("Install CodeLite")
taskMessages+=("Processing CodeLite")
taskDescriptions+=("A C/C++, PHP and JavaScript IDE for developers")
taskRecipes+=("installCodeLite")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installCodeLite()
{
  addPackage "codelite" 
  addPackage "wxcrafter"
  addPackage "codelite-plugins"
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install Visual Studio Code")
taskMessages+=("Processing Visual Studio Code")
taskDescriptions+=("A source code editor developed by Microsoft")
taskRecipes+=("installVSCode")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installVSCode()
{
snap install --classic vscode
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install Atom")
taskMessages+=("Processing Atom")
taskDescriptions+=("A 'hackable' text editor")
taskRecipes+=("installAtom")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installAtom()
{

snap install  --classic atom 
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

taskNames+=("Install GitKraken")
taskMessages+=("Processing GitKraken")
taskDescriptions+=("A graphical git client from Axosoft")
taskRecipes+=("installGitKraken")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installGitKraken()
{
  sudo snap install gitkraken --classic 
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install SmartGit")
taskMessages+=("Processing SmartGit")
taskDescriptions+=("A graphical git client from Syntevo")
taskRecipes+=("installSmartGit")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installSmartGit()
{
  installPackage "https://www.syntevo.com/downloads/smartgit/smartgit-17_1_6.deb"
}
#
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install rEFInd")
taskMessages+=("Processing rEFInd")
taskDescriptions+=("An EFI boot manager")
taskRecipes+=("installrEFInd")
taskPostInstallations+=("postrEFInd")
taskSelectedList+=("FALSE")

installrEFInd()
{
  addRepo "ppa:rodsmith/refind"
  addPackage "refind"
}

postrEFInd()
{
  refind-install --shim /boot/efi/EFI/ubuntu/shimx64.efi --localkeys
  refind-mkdefault
}
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Discord")
taskMessages+=("Processing Discord")
taskDescriptions+=("Gaming voice/chat service")
taskRecipes+=("installDiscord")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installDiscord()
{
   installPackage "https://dl.discordapp.net/apps/linux/0.0.4/discord-0.0.4.deb"

}
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------

taskNames+=("Install Gnome System Monitor")
taskMessages+=("Processing Gnome System Monitor")
taskDescriptions+=("A system resource usage monitor")
taskRecipes+=("installSystemMonitor")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installSystemMonitor()
{
  addPackage "gnome-system-monitor"
}
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------

taskNames+=("Install Kdenlive")
taskMessages+=("Processing Kdenlive")
taskDescriptions+=("A video editing suite")
taskRecipes+=("installKdenlive")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installKdenlive()
{
  addPackage "kdenlive"
}
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Openshot")
taskMessages+=("Processing Openshot")
taskDescriptions+=("A video editor")
taskRecipes+=("installOpenshot")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installOpenshot()
{
  addPackage "openshot-qt"
}
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
taskNames+=("Install Wireshark")
taskMessages+=("Processing Wireshark")
taskDescriptions+=("A network traffic analyzer")
taskRecipes+=("installWireshark")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installWireshark()
{
  echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections
  DEBIAN_FRONTEND=noninteractive
  addPackage "wireshark"
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#----------------------------------------------------------------------------
#------------------------------------------------------------------------------

 taskNames+=("Install Kata Containers")
 taskMessages+=("Processing Kata Containers")
 taskDescriptions+=("A halfway point between Virtualization and Containers. New, slim VMs")
 taskRecipes+=("installKata")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installKata(){
	 snap install kata-containers --classic
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Cacher")
 taskMessages+=("Processing Cacher")
 taskDescriptions+=("A snippet management system")
 taskRecipes+=("installCacher")
 taskPostInstallations+=(" ")
 taskSelectedList+=("false")

installCacher()
{
 snap install cacher
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Sublime Text")
 taskMessages+=("Basic Code Writing Program")
 taskDescriptions+=("installSublime")
 taskRecipes+=("installSublime")
 taskPostInstallations+=("")
 taskSelectedList+=("Task boolean value")
installSublime(){
snap install --classic sublime-text
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Brackets")
 taskMessages+=("Processing Brackets")
 taskDescriptions+=("Another Text Editor w/ Live Preview")
 taskRecipes+=("installBrackets")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBrackets(){
snap install --classic brackets
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Simply Fortran")
 taskMessages+=("Processing Simply Fortran")
 taskDescriptions+=("IDE for ForTran")
 taskRecipes+=("installSimplyForTran")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installSimplyFortran(){
snap install simplyfortran --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Hugo")
 taskMessages+=("Processing Hugo")
 taskDescriptions+=("Website Builder")
 taskRecipes+=("installHugo")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installHugo(){
snap install hugo --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Docker")
 taskMessages+=("Processing Docker")
 taskDescriptions+=("Container technology made by idiots")
 taskRecipes+=("installDocker")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installDocker(){
snap install docker
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

 taskNames+=("Install Vagrant")
 taskMessages+=("Processing Vagrant")
 taskDescriptions+=("Creates an environment similar to chroot for development")
 taskRecipes+=("installVagrant")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installVagrant(){
  sudo snap install --classic vagrant
  addPackage "vagrant-libvirt"
  addPackage "vagrant-lxc"
  addPackage "vagrant-mutate"
  addPackage "vagrant-sshfs"
  addPackage "vagrant-cachier"
  addPackage "vagrant-digitalocean"
  addPackage "python-vagrant"
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install LXD")
 taskMessages+=("Processing LXD")
 taskDescriptions+=("Docker Alternative by Canonical")
 taskRecipes+=("installlxd")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installlxd(){
snap install lxd --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

 taskNames+=("Install Jenkins")
 taskMessages+=("Processing Jenkins")
 taskDescriptions+=("Automation Software")
 taskRecipes+=("installJenkins")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installJenkins(){
snap install jenkins --classic
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

 taskNames+=("Install Conjure-Up")
 taskMessages+=("Processing Conjure-Up")
 taskDescriptions+=("Canonical's Half Baked Autoinstaller")
 taskRecipes+=("installconjure-up")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installConjure-Up(){
snap install conjure-up --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

 taskNames+=("Install Ubuntu Make")
 taskMessages+=("Processing Ubuntu Make")
 taskDescriptions+=("Canonical's development environment provisioner that handle all dependencies, even those which aren't in Ubuntu itself, and install latest versions of the desired and recommended tools")
 taskRecipes+=("installubuntumake")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installubuntumake(){
sudo snap install ubuntu-make --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

 taskNames+=("Install Kotlin")
 taskMessages+=("Processing Kotlin")
 taskDescriptions+=("JetBrainz in-house Language")
 taskRecipes+=("installKotlin")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installKotlin(){
snap install kotlin --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Kotlin-Native")
 taskMessages+=("Processing Kotlin-Native")
 taskDescriptions+=("Kotlin for Mobile")
 taskRecipes+=("installKotlinNative")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installKotlinNative(){
sudo snap install kotlin-native --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Go")
 taskMessages+=("Processing Go")
 taskDescriptions+=("Language, Google's Answer to JS")
 taskRecipes+=("installGo")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installGo(){
sudo snap install go --channel=1.11/stable --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

 taskNames+=("Install Ruby")
 taskMessages+=("Processing Ruby")
 taskDescriptions+=("Language for Back End Use Primarily")
 taskRecipes+=("installRuby")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installRuby(){
sudo snap install ruby --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install GRV")
 taskMessages+=("Processing GRV")
 taskDescriptions+=("Git Repo Manipulation from the Command Line")
 taskRecipes+=("installGRV")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installgrv(){
sudo snap install grv
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Brave")
 taskMessages+=("Processing Brave")
 taskDescriptions+=("Secure (supposedly) Browser")
 taskRecipes+=("installBrave")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBrave(){
sudo snap install brave --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Digital Ocean CTL")
 taskMessages+=("Processing Digital Ocean CTL")
 taskDescriptions+=("Command Line Droplet Control")
 taskRecipes+=("installdoctl")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installdoctl(){
sudo snap install doctl --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install AWS CTL")
 taskMessages+=("Processing AWS CTL")
 taskDescriptions+=("Command Line Control of AWS")
 taskRecipes+=("installawsctl")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installawsctl(){
sudo snap install aws-ctl --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Poddr")
 taskMessages+=("Processing Poddr")
 taskDescriptions+=("Podcast Client")
 taskRecipes+=("installPoddr")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installPoddr(){
sudo snap install poddr
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install YakYak")
 taskMessages+=("Processing YakYak")
 taskDescriptions+=("Chat Client")
 taskRecipes+=("installYakYak")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installYakYak(){
sudo snap install yakyak
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Flock Chat")
 taskMessages+=("Processing Flock Chat")
 taskDescriptions+=("Slack Like Chat Application")
 taskRecipes+=("installFlockChat")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installFlockChat(){
sudo snap install flock-chat
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install FKILL")
 taskMessages+=("Processing FKILL")
 taskDescriptions+=("Process Obliterater")
 taskRecipes+=("installFKILL")
 taskPostInstallations+=("postFKILL")
 taskSelectedList+=("false")
installFKILL(){
sudo snap install fkill --classic
 }
 postFKILL(){
sudo snap connect fkill:process-control :process-control
sudo snap connect fkill:system-observe :system-observel
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Instagraph")
 taskMessages+=("Processing Instagraph")
 taskDescriptions+=("A desktop instagram client")
 taskRecipes+=("installInstagraph")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installInstagraph(){
sudo snap install instagraph
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Gravit Designer")
 taskMessages+=("Processing Gravit Designer")
 taskDescriptions+=("Vector drawing application minus the Adobe fee.")
 taskRecipes+=("installGravitDesigner")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installGravitDesigner(){
sudo snap install gravit-designer
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Vector")
 taskMessages+=("Processing Gravit Designer")
 taskDescriptions+=("Vector drawing application, most like Illistrator.")
 taskRecipes+=("installVector")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installVector(){
sudo snap install vector
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Pencilsheep")
 taskMessages+=("Processing Pencilsheep")
 taskDescriptions+=("GPU optimized image editing. The most like Photoshop of the options available from this list")
 taskRecipes+=("installPencilsheep")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installPencilsheep(){
sudo snap install pencilsheep
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Imagenes")
 taskMessages+=("Processing Imagenes")
 taskDescriptions+=("Google Photos on Desktop")
 taskRecipes+=("installImagenes")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installImagenes(){
sudo snap install imagenes
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Mountain Tapir")
 taskMessages+=("Processing Mountain Tapir")
 taskDescriptions+=("Picture Stitcher for those bomb Instagram posts")
 taskRecipes+=("installMountainTapir")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installMountainTapir(){
sudo snap install mountain-tapir
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Photoscape")
 taskMessages+=("Processing Photoscape")
 taskDescriptions+=("Image editing suite")
 taskRecipes+=("installPhotoscape")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installPhotoscape(){
sudo snap install photoscape
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Simple Note")
 taskMessages+=("Processing Simple Note")
 taskDescriptions+=("A 'simple' note taker, decent replacement for Giganotes or EverNote")
 taskRecipes+=("installSimpleNote")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installSimpleNote(){
sudo snap install simplenote
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Nextcloud Client")
 taskMessages+=("Processing Nextcloud Client")
 taskDescriptions+=("Desktop client for Nextcloud")
 taskRecipes+=("installNextcloudClient")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installNextcloudClient(){
sudo snap install nextcloud-client
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Nextcloud Client")
 taskMessages+=("Processing Nextcloud")
 taskDescriptions+=("The Nextcloud server application as a Snap Package")
 taskRecipes+=("installNextcloud")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installNextcloud(){
sudo snap install nextcloud
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install QOwnNotes")
 taskMessages+=("Processing QOwnNotes")
 taskDescriptions+=("Cloud sync ready Note Taker, works with NextCloud")
 taskRecipes+=("installQOwnNotes")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installQOwnNotes(){
sudo snap install qownnotes
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install MicroPad")
 taskMessages+=("Processing MicroPad")
 taskDescriptions+=("Independent online-capable note taker made in New Zealand")
 taskRecipes+=("installMicroPad")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installMicroPad(){
sudo snap install micropad
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Buka")
 taskMessages+=("Processing Buka")
 taskDescriptions+=("Ebook Reader")
 taskRecipes+=("installBuka")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBuka(){
sudo snap install buka
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Outwiker")
 taskMessages+=("Processing Outwiker")
 taskDescriptions+=("Wiki Maker")
 taskRecipes+=("installOutwiker")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installOutwiker(){
sudo snap install outwiker --beta
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Wordpress")
 taskMessages+=("Processing Wordpress")
 taskDescriptions+=("Desktop Application for Wordpress.com")
 taskRecipes+=("installWordpress")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installWordpress(){
sudo snap install wordpress-desktop
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Zenkit")
 taskMessages+=("Processing Zenkit")
 taskDescriptions+=("Project Manager")
 taskRecipes+=("installZenkit")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installZenkit(){
sudo snap install zenkit
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install BitWarden")
 taskMessages+=("Processing BitWarden")
 taskDescriptions+=("Password Manager")
 taskRecipes+=("installBitWarden")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBitWarden(){
sudo snap install bitwarden
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

 taskNames+=("Install XNviewmp")
 taskMessages+=("Processing XNviewmp")
 taskDescriptions+=("Image Viewer")
 taskRecipes+=("installXNviewmp")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installXNviewmp(){
sudo snap install xnviewmp
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

 taskNames+=("Install Krop")
 taskMessages+=("Processing Krop")
 taskDescriptions+=("Image Cropper")
 taskRecipes+=("installkrop")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installkrop(){
sudo snap install krop
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install XNsketch")
 taskMessages+=("Processing XNsketch")
 taskDescriptions+=("Image Styler")
 taskRecipes+=("installXNsketch")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installXNsketch(){
sudo snap install xnsketch
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install HTop")
 taskMessages+=("Processing HTop")
 taskDescriptions+=("CTL System Monitor")
 taskRecipes+=("installhtop")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installhtop(){
sudo snap install htop
 }
#
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

 taskNames+=("Install CoPay")
 taskMessages+=("Processing CoPay")
 taskDescriptions+=("Shared BTC Wallet")
 taskRecipes+=("installCoPay")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installCoPay(){
sudo snap install CoPay
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Udemy")
 taskMessages+=("Processing Udemy")
 taskDescriptions+=("Easy Access to Udemy")
 taskRecipes+=("installudemy")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installudemy(){
sudo snap install udemy
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Raven Reader")
 taskMessages+=("Processing Raven Reader")
 taskDescriptions+=("Offline News Reader")
 taskRecipes+=("installRavenReader")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installRavenReader(){
sudo snap install raven-reader
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Clementine")
 taskMessages+=("Processing Clementine")
 taskDescriptions+=("Music Player for Various File Types")
 taskRecipes+=("installClementine")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installClementine(){
sudo snap install clementine
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Zulip")
 taskMessages+=("Processing Zulip")
 taskDescriptions+=("Slack Clone")
 taskRecipes+=("installzulip")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installzulip(){
sudo snap install zulip
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install BitPay")
 taskMessages+=("Processing BitPay")
 taskDescriptions+=("Secure BTC wallet")
 taskRecipes+=("installBitPay")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBitPay(){
sudo snap install bitpay
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Snap Store")
 taskMessages+=("Processing Snap Store")
 taskDescriptions+=("Snap Package Manager GUI")
 taskRecipes+=("installSnapStore")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installSnapStore(){
sudo snap install snap-store
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install HTMLDoc")
 taskMessages+=("Processing HTMLDoc")
 taskDescriptions+=("Application Shifting HTML into a PDF (for books)")
 taskRecipes+=("installhtmldoc")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installhtmldoc(){
sudo snap install htmldoc
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install OMan")
 taskMessages+=("Processing OMan")
 taskDescriptions+=("Man Page Reader")
 taskRecipes+=("installoman")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installoman(){
sudo snap install oman
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install MDBook")
 taskMessages+=("Processing MDBook")
 taskDescriptions+=("CLT for turning MarkDown files into a book")
 taskRecipes+=("installmdbook")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installmdbook(){
sudo snap install mdbook
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

 taskNames+=("Install Electrum Wallet")
 taskMessages+=("Processing Electrum Wallet")
 taskDescriptions+=("Secure BTC Wallet")
 taskRecipes+=("installelectrum")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installelectrum(){
sudo snap install electrum
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Fetch-BTC")
 taskMessages+=("Processing Fetch-BTC")
 taskDescriptions+=("BTC value tracker")
 taskRecipes+=("installfetchbtc")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installfetchbtc(){
sudo snap install fetch-btc
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Coulr")
 taskMessages+=("Processing Coulr")
 taskDescriptions+=("A pleasant little color picker program")
 taskRecipes+=("installCoulr")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installCoulr(){
sudo snap install coulr
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Bob Ross Quotes")
 taskMessages+=("Processing Bob Ross Quotes")
 taskDescriptions+=("Commandline tool for happy little accidents")
 taskRecipes+=("installbobrossquotes")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installbobrossquotes(){
sudo snap install bobrossquotes
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install Grub Customizer")
taskMessages+=("Processing Grub Customizer")
taskDescriptions+=("A hackable text editor")
taskRecipes+=("installGrubCustom")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installGrubCustom()
{
  addRepo "ppa:danielrichter2007/grub-customizer"
  addPackage "grub-customizer"
}
#
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install X11 Utilities")
 taskMessages+=("Processing x11 Utilities")
 taskDescriptions+=("Display Stuff Over SSH")
 taskRecipes+=("installX11")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installX11(){
addPackage "x11-session-utils"
addPackage "xtv"
addPackage "x11-apps"
addPackage "x11vnc"
addPackage "xserver-xorg-video-all"
addPackage "x11-utils"
addPackage "x11-common"
addPackage "x11-xserver-utils"
addPackage "freerdp-x11"
addPackage "x11vnc-data"
addPackage "libx11-freedesktop-desktopentry-perl"
addPackage "tigervnc-xorg-extension"
addPackage "xserver-xorg-video-all"
addPackage "freerdp2-x11"
addPackage "freerdp2-shadow-x11"
addPackage "xorg"
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Virtualization Package")
 taskMessages+=("Processing Virtualization Package")
 taskDescriptions+=("Install Applications Useful for Virtualization")
 taskRecipes+=("installVirtualizationPackage")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installVirtualizationPackage(){
addPackage "vde2"
addPackage "libvirt-bin"
addPackage "tk8.6"
addPackage "tk"
addPackage "tcl8.6"
addPackage "tcl"
addPackage "libtk8.6"
addPackage "qemu-kvm"
addPackage "aqemu"
addPackage "overlayroot"
addPackage "open-vm-tools"
addPackage "virt-viewer"
addPackage "libvirt0"
addPackage "fonts-ubuntu-console"
addPackage "ethtool"
addPackage "bridge-utils"
addPackage "virtinst"
addPackage "virt-manager"
 }

#------------------------------------------------------------------------------
 taskNames+=("Install Deluge")
 taskMessages+=("Processing Deluge")
 taskDescriptions+=("Torrent Downloader")
 taskRecipes+=("installDeluge")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installDeluge(){

addPackage "deluged"
addPackage "deluge"
addPackage "deluge-common"
addPackage "deluge-console"
addPackage "deluge-gtk"
addPackage "deluge-torrent"
addPackage "deluge-web"
 }


#------------------------------------------------------------------------------

# INSTRUCTIONS
# To add a new task, add a new section above this block copying and pasting the following 5 lines:

# taskNames+=("<Task Name>")
# taskMessages+=("<Task message>")
# taskDescriptions+=("<Task description>")
# taskRecipes+=("<Task recipe function>")
# taskPostInstallations+=("<Task post-installation function>")
# taskSelectedList+=("Task boolean value")

# Then, uncomment them and:

# Replace <Task Name> with the new task's name.
# Replace <Task message> with the message that will be displayed while.
# performing the task, i.e. "Upgrading the system" .
# Replace <Task description> with the new task's description.
# Replace <Task recipe function> with the function name which will contain
# the necessary commands to perform the task and write that function. Do NOT use sudo in it.
# Replace <Task post-installation function> with the function name which will contain
# the necessary commands to execute after installation and write that function. Do NOT use sudo in it.
# If you don't need anything to be run after installatio, just leave the function blank
# or use taskPostInstallations+=("")
# Replace <Task boolean value> with TRUE of FALSE to make this task to be marked by default.
#------------------------------------------------------------------------------
# END OF TASK LIST ############################################################
#------------------------------------------------------------------------------

# Main function
function main()
{
  # Check that the recipe arrays are well formed

  if [[ ${#taskNames[@]} -ne ${#taskMessages[@]} ]] ||
     [[ ${#taskMessages[@]} -ne ${#taskDescriptions[@]} ]] ||
     [[ ${#taskDescriptions[@]} -ne ${#taskRecipes[@]} ]] ||
     [[ ${#taskRecipes[@]} -ne ${#taskPostInstallations[@]} ]] ||
     [[ ${#taskPostInstallations[@]} -ne ${#taskSelectedList[@]} ]] ; then

    if ! checkPackage zenity; then
      echo "There is an error in the some recipe. Array lengths do not match. Please check your recipes."
    else
      zenity --error --title="colt45" --text="There is an error in the some recipe. Array lengths do not match. Please check your recipes."
    fi

    exit 1
  fi



  # Get system info
  OSarch=$(uname -m)
  OSname=$(lsb_release -si)
  #OSversion=$(lsb_release -sr)
  #OScodeName=$(lsb_release -sc)
  OSbaseCodeName=$(lsb_release -scu)
  lang=$(locale | grep LANGUAGE | cut -d= -f2 | cut -d_ -f1)


  # Test /var/lib/dpkg/lock to ensure we can install packages
  lock=$(fuser /var/lib/dpkg/lock)

  if [ ! -z "$lock" ]; then
    if ! $(checkPackage zenity); then
      echo "Another program is installing or updating packages. Please wait until this process finishes and then launch colt45 again."
    else
      zenity --error --title="colt45" --text="Another program is installing or updating packages. Please wait until this process finishes and then launch colt45 again."
    fi
    exit 0
  fi

  # Repair installation interruptions
  dpkg --configure -a

  # Get list of already added repos

  installedRepos=()

  getRepoList
# Add Repos


  #Install Snap and Flatpak
  if ! $(checkPackage snapd); then
    addPackage "snapd"
  fi


  # Check if Zenity package is installed
  if ! $(checkPackage zenity); then
    installPackage "zenity"
  fi


  # Test connectivity
  if ! ping -c 1 google.com >> /dev/null 2>&1; then
    zenity --error --title="colt45" --text="There is No Connection to the Internet. Please Try Again After Connecting"
    exit 0
  fi


  # Create selection GUI with Zenity
  while true; do

    # Build task table for Zenity
    taskTable=()

    for (( i=0; i<${#taskNames[@]}; i++ )); do
        taskTable+=("${taskSelectedList[$i]}" "${taskNames[$i]}" "${taskDescriptions[$i]}")
    done

    tasks=$(zenity --list --checklist \
      --height 1200 \
      --width 1500 \
      --title="colt45" \
      --text "Select Packages to Provision Your System With:" \
      --column=Selection \
      --column=Task \
      --column=Description \
      "${taskTable[@]}" \
      --separator=', '
    )

    # Check for closed window / cancel button
    if [[ $? == 1 ]]; then
      exit 0
    fi

    # Check zero tasks selected
    if [[ -z "$tasks" ]]; then
      zenity --info --title="colt45" --text "Fool! No Tasks Were Selected"
      continue
    fi

    # Save selected tasks
    for i in "${!taskNames[@]}"; do
      if [[ $tasks == *"${taskNames[i]}"* ]]; then
        taskSelectedList[$i]="TRUE"
      else
        taskSelectedList[$i]="FALSE"
      fi
    done

    # Warning message and confirmation
    message="The selected tasks will be performed now. \n"
    message+="You won't be able to cancel this operation once started.\n"
    message+="Are you sure you want to continue?"

    if zenity --question --title="colt45" --text "$message"; then
      break
    fi

  done

  # Write error log file header
  debugLog="/tmp/colt45-dbg.log"
  errorLog="/tmp/colt45-errors.log"

  logHeader="==================================================================================================\n"
  logHeader="${logHeader}NEW SESSION $(date)\n"
  logHeader="$logHeader$(lsb_release -d | cut -d: -f2 | sed "s/^[ \t]*//")\n"
  logHeader="$logHeader$(uname -a)\n"

  echo -e "$logHeader" >> $errorLog

  if $debug; then
    echo -e "$logHeader" >> $debugLog
  fi


  # Perform all tasks
  (
    errors=false

    for i in "${!taskNames[@]}"; do
      if [[ $tasks == *"${taskNames[i]}"* ]]; then

        echo -e "# Configuring Your System Now... [${taskMessages[i]}]"

        echo -e "--------------------------------------------------------------------------------------------------\n" >> $errorLog
        echo -e "RECIPE ${taskNames[$i]}\n" >> $errorLog

        if $debug; then
          ${taskRecipes[$i]} &>> $debugLog
        else
          ${taskRecipes[$i]} 2>&1
        fi

        if [[ $? -ne 0 ]]; then
          errors=true
        fi

      fi
    done

    # Add repos
    echo "# Adding repositories..."

    if $debug; then
      processRepos &>> $debugLog
    else
      processRepos 2>&1
    fi

    if [[ $? != 0 ]]; then
      errors=true
      echo -e "REPO_ERRORS_HAPPENED\n" >> $errorLog
    fi

    # Install packages
    echo "# Installing packages..."

    if $debug; then
      processPackages &>> $debugLog
    else
      processPackages 2>&1
    fi

    if [[ $? != 0 ]]; then
      errors=true
      echo -e "PACKAGE_ERRORS_HAPPENED\n" >> $errorLog
    fi

    # Run post-installation tasks
    echo "# Running post-installation tasks..."

    for i in "${!taskNames[@]}"; do
      if [[ $tasks == *"${taskNames[i]}"* ]]; then

        if $debug; then
          ${taskPostInstallations[$i]} &>> $debugLog
        else
          ${taskPostInstallations[$i]} 2>&1
        fi

        if [[ $? -ne 0 ]]; then
          errors=true
        fi

      fi
    done

    # End and notify
    if $errors ; then
      echo -ne "SOME_ERRORS_HAPPENED\n" >> $errorLog
      echo "# Some tasks ended with errors"
      if $(checkPackage libnotify-bin); then
        su "$SUDO_USER" -c 'notify-send -i utilities-terminal colt45 "Some tasks ended with errors"'
      fi
    else
      echo "# All tasks completed succesfully"
      if $(checkPackage libnotify-bin); then
        su "$SUDO_USER" -c 'notify-send -i utilities-terminal colt45 "All tasks completed!"'
      fi
    fi
  ) |
  zenity --progress \
         --pulsate \
         --no-cancel \
         --title="colt45" \
         --text="Processing all tasks" \
         --percentage=0 \
         --height 500 \
         --width 500

  # Show error list from the error log
  errors=false
  if [[ $(tail -1 $errorLog) == "SOME_ERRORS_HAPPENED" ]]; then
    errors=true
  fi

  if $errors ; then
    errorList=()

    # Last occurrence of NEW SESSION
    startLine=$(tac $errorLog | grep -n -m1 "NEW SESSION" | cut -d: -f1)

    while read line; do
      firstword=$(echo "$line" | cut -d' ' -f1)

      if [[ "$firstword" == "RECIPE" ]]; then # If line starts with RECIPE
          errorList+=("${line/RECIPE /}")
      fi
    done <<< "$(tail -n "$startLine" "$errorLog")" # Use the error log only from startLine to the end

    if [[ ${#errorList[@]} -gt 0 ]]; then

      message="The following tasks ended with errors and could not be completed:"

      zenity --list --height 1200 --width 1200 --title="colt45" \
             --text="$message" \
             --hide-header --column "Tasks with errors" "${errorList[@]}"

      message="Please notify the following error log at https://github.com/derkomai/colt45gui/issues\n"
      message+="-------------------------------------------------------------"
      message+="---------------------------------------------------------\n\n"

      echo -e "$message$(tail -n "$startLine" "$errorLog")" |
      zenity --text-info --height 700 --width 800 --title="colt45"

    fi
  fi
}
#-----------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------
# End of main function
#-----------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------


function packageExists()
{
  dpkg -l "$1" &> /dev/null

  if [[ $? == 0 ]]; then
    echo true
  else
    echo false
  fi
}


function checkPackage()
{
    if $(packageExists $1) && $(packageIsInstalled "$1"); then
        echo true
    else
        echo false
    fi
}


function addPackage()
{
  packages+=" $1"
}


function installPackage()
{
  for arg in "$@"; do
    if [[ "$arg" == "http"*".deb" ]]; then
      wget -q -O /tmp/package.deb "$arg"
      apt-get -y install /tmp/package.deb
      rm /tmp/package.deb
    else
      apt-get -y install "$arg"
    fi
  done
}


function processPackages()
{
  if $updateSystem; then
    apt-get -y upgrade
  fi

  # Install only packages that are not installed already
  packageList=""

  for package in $packages; do
      if ! $(checkPackage "$package"); then
          packageList+=" $package"
      fi
  done

  apt-get -y install $packageList
  apt-get -y autoremove
}


function getRepoList()
{
  # Get list of already added repos
  readarray installedRepos <<< "$(for APT in $(find /etc/apt/ -name \*.list); do
    grep -o "^deb http://ppa.launchpad.net/[a-z0-9\-]\+/[a-z0-9\-]\+" "$APT" | while read ENTRY ; do
        USER=$(echo "$ENTRY" | cut -d/ -f4)
        PPA=$(echo "$ENTRY" | cut -d/ -f5)
        echo "ppa:$USER/$PPA"
    done
  done)"
}


function checkRepo()
{
  for repo in "${installedRepos[@]}"; do
    if [[ $repo == "$1" ]]; then
      echo true
      return 0
    fi
  done
  echo false
}


function addRepo()
{
  repos+=($1)
}


function installRepo()
{
  if ! $(checkPackage "software-properties-common"); then
    installPackage "software-properties-common"
  fi

  add-apt-repository -y "$1"
}


function processRepos()
{
  # Ensure ppa adding capability
  if ! $(checkPackage "software-properties-common"); then
    installPackage "software-properties-common"
  fi

  for repo in "${repos[@]}"; do
    if ! $(checkRepo "$repo"); then
      add-apt-repository -y "$repo"
    fi
  done

  apt-get update
}


function getPassword()
{
  sudo -k

  while true; do
    password=$(zenity --password --title="colt45")

    # Check for closed window / cancel button
    if [[ $? == 1 ]]; then
      return 1
    fi

    # Check for correct password
    myid=$(echo "$password" | sudo -S id -u)

    if [[ $? == 0 ]] && [[ $myid == 0 ]]; then
      echo "$password"
      return 0
    else
        zenity --info --title="colt45" --text="Wrong password, try again"
    fi
  done
}


# RUN

# Check for root permissions and ask for password in other case
if [[ $(id -u) == 0 ]]; then
    main
else
    password=$(getPassword)

    if [[ $? == 0 ]]; then
      echo "$password" | sudo -S "$0"
    else
      exit 0
    fi
fi

#exit 0