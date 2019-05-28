#!/bin/bash
echo "Author: Thomas Leon Highbaugh aka TLH"
echo "colt45 GUI"
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
# INITIALIZATION ##############################################################
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
taskNames+=("Update system")
taskMessages+=("Updating system")
taskDescriptions+=("Install the latest version of all your software")
taskRecipes+=("updateSystem")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

updateSystem()
{
  updateSystem=true
}
#------------------------------------------------------------------------------
taskNames+=("Install Java, Flash and codecs")
taskMessages+=("Processing Java, Flash and codecs")
taskDescriptions+=("Install non-open-source packages like Java, Flash plugin, Unrar, and some audio and video codecs like MP3/AVI/MPEG")
taskRecipes+=("installRestrictedExtras")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installRestrictedExtras()
{
  addPackage "ubuntu-restricted-extras"
}
#------------------------------------------------------------------------------
taskNames+=("Install Snap Store")
 taskMessages+=("Processing Snap Store")
 taskDescriptions+=("Snap Package Manager GUI")
 taskRecipes+=("installSnapStore")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installSnapStore()
{
 snap install snap-store
 }
 #------------------------------------------------------------------------------
taskNames+=("Install AppCenter")
 taskMessages+=("Processing AppCenter")
 taskDescriptions+=("Snap Package Manager GUI")
 taskRecipes+=("installAppCenter")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installAppCenter()
{
addRepo "ppa:elementary-os/daily"
addPackage "appcenter"
}
#------------------------------------------------------------------------------
 taskNames+=("Install CoPay")
 taskMessages+=("Processing CoPay")
 taskDescriptions+=("Shared BTC Wallet")
 taskRecipes+=("installCoPay")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installCoPay()
{
 snap install CoPay
 }
 #------------------------------------------------------------------------------
 taskNames+=("Install BitPay")
 taskMessages+=("Processing BitPay")
 taskDescriptions+=("Secure BTC wallet")
 taskRecipes+=("installBitPay")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBitPay()
{
 snap install bitpay
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Electrum Wallet")
 taskMessages+=("Processing Electrum Wallet")
 taskDescriptions+=("Secure BTC Wallet")
 taskRecipes+=("installelectrum")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installelectrum()
{
 snap install electrum
 }
#------------------------------------------------------------------------------
taskNames+=("Install Chromium")
taskMessages+=("Processing Chromium")
taskDescriptions+=("The open-source web browser providing the code for Google Chrome.")
taskRecipes+=("installChromium")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installChromium()
{
  snap install chromium
}
#------------------------------------------------------------------------------
taskNames+=("Install Firefox")
taskMessages+=("Processing Firefox")
taskDescriptions+=("The web browser from Mozilla")
taskRecipes+=("installFirefox")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installFirefox()
{
  snap install firefox
}
#------------------------------------------------------------------------------
taskNames+=("Install Opera")
taskMessages+=("Processing Opera")
taskDescriptions+=("Just another web browser")
taskRecipes+=("installOpera")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installOpera()
{
  snap install opera
}
#------------------------------------------------------------------------------
 taskNames+=("Install Brave")
 taskMessages+=("Processing Brave")
 taskDescriptions+=("Secure (supposedly) Browser")
 taskRecipes+=("installBrave")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBrave()
{
   snap install brave --classic
 }
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
 taskNames+=("Install Deluge")
 taskMessages+=("Processing Deluge")
 taskDescriptions+=("Torrent Downloader")
 taskRecipes+=("installDeluge")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installDeluge()
{
  addPackage "deluged deluge deluge-common deluge-console deluge-gtk deluge-torrent deluge-web"
 }
#------------------------------------------------------------------------------
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
 #------------------------------------------------------------------------------
taskNames+=("Install Virtual Machine Manager")
taskMessages+=("Processing Virtual Machine Manager")
taskDescriptions+=("The FOSS VirtualBox manager that runs across SSH and features a number of useful features.")
taskRecipes+=("installVirtMan")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installVirtMan()
{
  addPackage "virt-manager"
}
 #------------------------------------------------------------------------------
taskNames+=("Install Gnome Boxes")
taskMessages+=("Processing Gnome Boxes")
taskDescriptions+=("Gnome's 'easy' VM manager that can run VMs remotely.")
taskRecipes+=("installGnomeBox")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installGnomeBox()
{
  addPackage "gnome-boxes"
}
#------------------------------------------------------------------------------
 taskNames+=("Install TeamViewer")
 taskMessages+=("Processing TeamViewer")
 taskDescriptions+=("A Remote Viewer Client")
 taskRecipes+=("installTV")
 taskPostInstallations+=("")
 taskSelectedList+=("False")
installTV()
{
installPackage "https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
}
 #------------------------------------------------------------------------------

 taskNames+=("Install Docker")
 taskMessages+=("Processing Docker")
 taskDescriptions+=("Container technology made by idiots")
 taskRecipes+=("installDocker")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installDocker()
{
snap install docker
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Vagrant")
 taskMessages+=("Processing Vagrant")
 taskDescriptions+=("Creates an environment similar to chroot for development")
 taskRecipes+=("installVagrant")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installVagrant()
{
   snap install --classic vagrant
  addPackage "vagrant-libvirt vagrant-lxc vagrant-mutate vagrant-sshfs vagrant-cachier vagrant-digitalocean python-vagrant"
 }
#------------------------------------------------------------------------------
 taskNames+=("Install LXD")
 taskMessages+=("Processing LXD")
 taskDescriptions+=("Docker Alternative by Canonical")
 taskRecipes+=("installlxd")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installlxd()
{
snap install lxd --classic
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Jenkins")
 taskMessages+=("Processing Jenkins")
 taskDescriptions+=("Automation Software")
 taskRecipes+=("installJenkins")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installJenkins()
{
  snap install jenkins --classic
}
#------------------------------------------------------------------------------
 taskNames+=("Install Conjure-Up")
 taskMessages+=("Processing Conjure-Up")
 taskDescriptions+=("Canonical's Half Baked Autoinstaller")
 taskRecipes+=("installConjureUp")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installConjureUp()
{
snap install conjure-up --classic
}
#------------------------------------------------------------------------------
 taskNames+=("Install Ubuntu Make")
 taskMessages+=("Processing Ubuntu Make")
 taskDescriptions+=("Canonical's development environment provisioner that handle all dependencies, even those which aren't in Ubuntu itself, and install latest versions of the desired and recommended tools")
 taskRecipes+=("installubuntumake")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installubuntumake()
{
 snap install ubuntu-make --classic
 }
#------------------------------------------------------------------------------
  taskNames+=("Install Digital Ocean CTL")
 taskMessages+=("Processing Digital Ocean CTL")
 taskDescriptions+=("Command Line Droplet Control")
 taskRecipes+=("installdoctl")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installdoctl()
{
 snap install doctl --classic
 }
#------------------------------------------------------------------------------
 taskNames+=("Install AWS CTL")
 taskMessages+=("Processing AWS CTL")
 taskDescriptions+=("Command Line Control of AWS")
 taskRecipes+=("installawsctl")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installawsctl()
{
 snap install aws-ctl --classic
 }
 #------------------------------------------------------------------------------
 taskNames+=("Install FKILL")
 taskMessages+=("Processing FKILL")
 taskDescriptions+=("Process Obliterater")
 taskRecipes+=("installFKILL")
 taskPostInstallations+=("postFKILL")
 taskSelectedList+=("false")
installFKILL()
{
 snap install fkill --classic
 }
 postFKILL()
{
 snap connect fkill:process-control :process-control
 snap connect fkill:system-observe :system-observel
}
#------------------------------------------------------------------------------
 taskNames+=("Install Nextcloud Server")
 taskMessages+=("Processing Nextcloud")
 taskDescriptions+=("The Nextcloud server application as a Snap Package")
 taskRecipes+=("installNextcloud")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installNextcloud()
{
 snap install nextcloud
 }

#------------------------------------------------------------------------------
 taskNames+=("Install Kata Containers")
 taskMessages+=("Processing Kata Containers")
 taskDescriptions+=("A halfway point between Virtualization and Containers. New, slim VMs")
 taskRecipes+=("installKata")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installKata()
{
 snap install kata-containers --classic
}
#------------------------------------------------------------------------------
 taskNames+=("Install Nextcloud Client")
 taskMessages+=("Processing Nextcloud Client")
 taskDescriptions+=("Desktop client for Nextcloud")
 taskRecipes+=("installNextcloudClient")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installNextcloudClient()
{
 snap install nextcloud-client
 }
#------------------------------------------------------------------------------
taskNames+=("Install Cockpit")
taskMessages+=("Processing Cockpit")
taskDescriptions+=("Web interface for your system")
taskRecipes+=("installCockpit")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")
installCockpit()
{
  addPackage "cockpit-dashboard cockpit-docker cockpit-networkmanager cockpit-packagekit cockpit-bridge cockpit"
}
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------

 taskNames+=("Install HTop")
 taskMessages+=("Processing HTop")
 taskDescriptions+=("CTL System Monitor")
 taskRecipes+=("installhtop")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installhtop()
{
 snap install htop
 }
 #------------------------------------------------------------------------------
taskNames+=("Install Cubic")
taskMessages+=("Processing Cubic")
taskDescriptions+=("Create Custom Live USBs")
taskRecipes+=("installCubic")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installCubic()
{
  addPackage "cubic"
    addRepo "ppa:cubic-wizard/release"
}
#------------------------------------------------------------------------------
 taskNames+=("Install YakYak")
 taskMessages+=("Processing YakYak")
 taskDescriptions+=("Chat Client")
 taskRecipes+=("installYakYak")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installYakYak()
{
   snap install yakyak
}
#------------------------------------------------------------------------------
 taskNames+=("Install Signal")
 taskMessages+=("Processing Signal")
 taskDescriptions+=("Secure chat and text messages")
 taskRecipes+=("installSignal")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installSignal()
{
   snap install signal-desktop
}
#------------------------------------------------------------------------------
 taskNames+=("Install Facebook Messenger")
 taskMessages+=("Processing FBMessenger")
 taskDescriptions+=("Desktop access to Facebook messenger.")
 taskRecipes+=("installFBMess")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installFBMess()
{
   snap install messengerport
}
#------------------------------------------------------------------------------
 taskNames+=("Install Wire")
 taskMessages+=("Processing Wire")
 taskDescriptions+=("Secure Skype replacement with accompanying mobile app for Andrroid")
 taskRecipes+=("installWire")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installWire()
{
   snap install wire
}
#------------------------------------------------------------------------------
taskNames+=("Install Telegram")
taskMessages+=("Processing Telegram")
taskDescriptions+=("A chat client, similar to Whatsapp, Viber, Facebook Messenger or Google Hangouts")
taskRecipes+=("installTelegram")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installTelegram()
{
  snap install telegram-desktop
}
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
taskNames+=("Install Slack")
taskMessages+=("Processing Slack")
taskDescriptions+=("A team communication application")
taskRecipes+=("installSlack")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installSlack()
{
  installPackage "https://downloads.slack-edge.com/linux_releases/slack-desktop-2.3.3-amd64.deb"
}
#------------------------------------------------------------------------------
 taskNames+=("Install Flock Chat")
 taskMessages+=("Processing Flock Chat")
 taskDescriptions+=("Slack Like Chat Application")
 taskRecipes+=("installFlockChat")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installFlockChat()
{
   snap install flock-chat
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Zulip")
 taskMessages+=("Processing Zulip")
 taskDescriptions+=("Slack Clone")
 taskRecipes+=("installzulip")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installzulip()
{
   snap install zulip
 }
#------------------------------------------------------------------------------
taskNames+=("Install VLC")
taskMessages+=("Processing VLC")
taskDescriptions+=("The most famous multimedia player")
taskRecipes+=("installVLC")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")
installVLC()
{
   snap install vlc
  addPackage "browser-plugin-vlc libvlc-bin libvlc5 libvlccore9 vlc-bin vlc-data vlc-plugin-access-extra vlc-plugin-base vlc-plugin-video-output vlc-plugin-qt"
}
#------------------------------------------------------------------------------
taskNames+=("Install Handbrake")
taskMessages+=("Processing Handbrake")
taskDescriptions+=("A video transcoder")
taskRecipes+=("installHandbrake")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")
installHandbrake()
{
  snap install handbrake-jz
}
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
 taskNames+=("Install Udemy")
 taskMessages+=("Processing Udemy")
 taskDescriptions+=("Easy Access to Udemy")
 taskRecipes+=("installudemy")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installudemy()
{
 snap install udemy
 }
#------------------------------------------------------------------------------
taskNames+=("Install Spotify")
taskMessages+=("Processing Spotify...")
taskDescriptions+=("One of the best music streaming apps")
taskRecipes+=("installSpotify")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")
installSpotify()
{
  snap install spotify
}
#------------------------------------------------------------------------------
taskNames+=("Install Audacity")
taskMessages+=("Processing Audacity")
taskDescriptions+=("Record and edit audio files")
taskRecipes+=("installAudacity")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")
installAudacity()
{
  addPackage "audacity"
}
#------------------------------------------------------------------------------
taskNames+=("Install OBS Studio")
taskMessages+=("Processing OBS Studio")
taskDescriptions+=("Useful streaming and recording suite")
taskRecipes+=("installOBS")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")
installOBS()
{
  snap install obs-studio
}
#------------------------------------------------------------------------------
taskNames+=("Install Transitions DJ")
taskMessages+=("Processing Transitions DJ")
taskDescriptions+=("Music Mixing App for Live DJing and mixtape production")
taskRecipes+=("installTransitionsDJ")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")
installTransitionsDJ()
{
 snap install transitionsdj
}
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
 taskNames+=("Install Clementine")
 taskMessages+=("Processing Clementine")
 taskDescriptions+=("Music Player for Various File Types")
 taskRecipes+=("installClementine")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installClementine()
{
 snap install clementine
 }
 #------------------------------------------------------------------------------
 taskNames+=("Install Poddr")
 taskMessages+=("Processing Poddr")
 taskDescriptions+=("Podcast Client")
 taskRecipes+=("installPoddr")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installPoddr()
{
 snap install poddr
 }
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
 taskNames+=("Install Instagraph")
 taskMessages+=("Processing Instagraph")
 taskDescriptions+=("A desktop instagram client")
 taskRecipes+=("installInstagraph")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installInstagraph()
{
 snap install instagraph
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Gravit Designer")
 taskMessages+=("Processing Gravit Designer")
 taskDescriptions+=("Vector drawing application minus the Adobe fee.")
 taskRecipes+=("installGravitDesigner")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installGravitDesigner()
{
 snap install gravit-designer
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Vector")
 taskMessages+=("Processing Gravit Designer")
 taskDescriptions+=("Vector drawing application, most like Illistrator.")
 taskRecipes+=("installVector")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installVector()
{
 snap install vector
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Pencilsheep")
 taskMessages+=("Processing Pencilsheep")
 taskDescriptions+=("GPU optimized image editing. The most like Photoshop of the options available from this list")
 taskRecipes+=("installPencilsheep")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installPencilsheep()
{
 snap install pencilsheep
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Imagenes")
 taskMessages+=("Processing Imagenes")
 taskDescriptions+=("Google Photos on Desktop")
 taskRecipes+=("installImagenes")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installImagenes()
{
 snap install imagenes
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Mountain Tapir")
 taskMessages+=("Processing Mountain Tapir")
 taskDescriptions+=("Picture Stitcher for those bomb Instagram posts")
 taskRecipes+=("installMountainTapir")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installMountainTapir()
{
 snap install mountain-tapir
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Photoscape")
 taskMessages+=("Processing Photoscape")
 taskDescriptions+=("Image editing suite")
 taskRecipes+=("installPhotoscape")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installPhotoscape()
{
 snap install photoscape
 }
#------------------------------------------------------------------------------
 taskNames+=("Install XNviewmp")
 taskMessages+=("Processing XNviewmp")
 taskDescriptions+=("Image Viewer")
 taskRecipes+=("installXNviewmp")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installXNviewmp()
{
 snap install xnviewmp
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Krop")
 taskMessages+=("Processing Krop")
 taskDescriptions+=("Image Cropper")
 taskRecipes+=("installkrop")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installkrop()
{
 snap install krop
 }
#------------------------------------------------------------------------------
 taskNames+=("Install XNsketch")
 taskMessages+=("Processing XNsketch")
 taskDescriptions+=("Image Styler")
 taskRecipes+=("installXNsketch")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installXNsketch()
{
 snap install xnsketch
 }
 #------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
taskNames+=("Install Lanto")
taskMessages+=("Processing Lanto")
taskDescriptions+=("Cre")
taskRecipes+=("installLanto")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installLanto()
{
  snap install lanto
}
#------------------------------------------------------------------------------
taskNames+=("Install Blender")
taskMessages+=("Processing Blender")
taskDescriptions+=("3D modelling, animation, rendering and production")
taskRecipes+=("installBlender")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installBlender()
{
  addPackage "blender"
}

taskNames+=("Install Wine")
taskMessages+=("Processing Wine")
taskDescriptions+=("A tool to install Windows software on Linux")
taskRecipes+=("installWine")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installWine()
{
  snap install wine
  apt-get update
  apt-get install --install-recommends winehq-stable
}
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
taskNames+=("Install Alacarte")
taskMessages+=("Processing Alacarte")
taskDescriptions+=("Another Menu Editor! Two is better than one :]")
taskRecipes+=("installAlacarte")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installAlacarte()
{
  addPackage "alacarte"
}
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
 taskNames+=("Install BitWarden")
 taskMessages+=("Processing BitWarden")
 taskDescriptions+=("Password Manager")
 taskRecipes+=("installBitWarden")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBitWarden()
{
 snap install bitwarden
 }
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
 taskNames+=("Install Hugo")
 taskMessages+=("Processing Hugo")
 taskDescriptions+=("Website Builder")
 taskRecipes+=("installHugo")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installHugo()
{
snap install hugo --classic
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Wordpress")
 taskMessages+=("Processing Wordpress")
 taskDescriptions+=("Desktop Application for Wordpress.com")
 taskRecipes+=("installWordpress")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installWordpress()
{
 snap install wordpress-desktop
 }

#------------------------------------------------------------------------------
 taskNames+=("Install Simple Note")
 taskMessages+=("Processing Simple Note")
 taskDescriptions+=("A 'simple' note taker, decent replacement for Giganotes or EverNote")
 taskRecipes+=("installSimpleNote")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installSimpleNote()
{
 snap install simplenote
 }
 #------------------------------------------------------------------------------
 taskNames+=("Install BoostNote")
 taskMessages+=("Processing BoostNote")
 taskDescriptions+=("A 'simple' note taker, decent replacement for Giganotes or EverNote")
 taskRecipes+=("installBoostNote")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBoostNote()
{
  installPackage "https://github.com/BoostIO/boost-releases/releases/download/v0.11.17/boostnote_0.11.17_amd64.deb"
   }
 #------------------------------------------------------------------------------
 taskNames+=("Install CherryTree")
 taskMessages+=("Processing CherryTree")
 taskDescriptions+=("A heirarchial note taker to arrange notes like Wikis")
 taskRecipes+=("installCherryTree")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installCherryTree()
{
    addPackage "cherrytree"
 }
#------------------------------------------------------------------------------
 taskNames+=("Install QOwnNotes")
 taskMessages+=("Processing QOwnNotes")
 taskDescriptions+=("Cloud sync ready Note Taker, works with NextCloud")
 taskRecipes+=("installQOwnNotes")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installQOwnNotes()
{
 snap install qownnotes
 }
#------------------------------------------------------------------------------
 taskNames+=("Install MicroPad")
 taskMessages+=("Processing MicroPad")
 taskDescriptions+=("Independent online-capable note taker made in New Zealand")
 taskRecipes+=("installMicroPad")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installMicroPad()
{
 snap install micropad
 }
#------------------------------------------------------------------------------
taskNames+=("Install GigaNotes")
 taskMessages+=("Processing GigaNotes")
 taskDescriptions+=("Online-capable note taker tha works across platforms and on the web")
 taskRecipes+=("installGigaNotes")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installGigaNotes()
{
 snap install giganotes
 }
#------------------------------------------------------------------------------
taskNames+=("Install P3X OneNote")
 taskMessages+=("Processing P3X OneNote")
 taskDescriptions+=("Online-capable note taker tha works across platforms and on the web")
 taskRecipes+=("installOneNote")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installOneNote()
{
 snap install p3x-onenote
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Outwiker")
 taskMessages+=("Processing Outwiker")
 taskDescriptions+=("Wiki Maker")
 taskRecipes+=("installOutwiker")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installOutwiker()
{
snap install outwiker --beta
 }
 #------------------------------------------------------------------------------
 taskNames+=("Install HTMLDoc")
 taskMessages+=("Processing HTMLDoc")
 taskDescriptions+=("Application Shifting HTML into a PDF (for books)")
 taskRecipes+=("installhtmldoc")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installhtmldoc()
{
 snap install htmldoc
 }
#------------------------------------------------------------------------------
 taskNames+=("Install OMan")
 taskMessages+=("Processing OMan")
 taskDescriptions+=("Man Page Reader")
 taskRecipes+=("installoman")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installoman()
{
 snap install oman
 }
#------------------------------------------------------------------------------
 taskNames+=("Install MDBook")
 taskMessages+=("Processing MDBook")
 taskDescriptions+=("CLT for turning MarkDown files into a book")
 taskRecipes+=("installmdbook")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installmdbook()
{
snap install mdbook
 }
#------------------------------------------------------------------------------
taskNames+=("Install SuperProductivity")
taskMessages+=("Processing SuperProductivity")
taskDescriptions+=("Attractive 'To Do' application. ")
taskRecipes+=("installSuperProductivity")
taskPostInstallations+=("")
taskSelectedList+=("false")
installSuperProductivity()
{
snap install mdbook
 }
#------------------------------------------------------------------------------

 taskNames+=("Install Bob Ross Quotes")
 taskMessages+=("Processing Bob Ross Quotes")
 taskDescriptions+=("Commandline tool for happy little accidents")
 taskRecipes+=("installbobrossquotes")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installbobrossquotes()
{
 snap install superproductivity
 }
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
#------------------------------------------------------------------------------
taskNames+=("Install Visual Studio Code")
taskMessages+=("Processing Visual Studio Code")
taskDescriptions+=("A source code editor developed by Microsoft")
taskRecipes+=("installVSCode")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installVSCode()
{
  snap install vscode
}
#------------------------------------------------------------------------------
taskNames+=("Install Atom")
taskMessages+=("Processing Atom")
taskDescriptions+=("A hackable text editor")
taskRecipes+=("installAtom")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installAtom()
{
  snap install atom --classic
}
#------------------------------------------------------------------------------
taskNames+=("Install CodeLite")
taskMessages+=("Processing CodeLite")
taskDescriptions+=("A C/C++, PHP and JavaScript IDE for developers")
taskRecipes+=("installCodeLite")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installCodeLite()
{
  addPackage "codelite wxcrafter codelite-plugins"
}
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
 taskNames+=("Install Leafpad")
 taskMessages+=("Lightweight text editor based on GTK+")
 taskDescriptions+=("installLeafpad")
 taskRecipes+=("installLeafpad")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installLeafpad()
{
  snap install leafpad
}
#------------------------------------------------------------------------------
 taskNames+=("Install Sublime Text")
 taskMessages+=("Basic Code Writing Program")
 taskDescriptions+=("installSublime")
 taskRecipes+=("installSublime")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installSublime()
{
  snap install --classic sublime-text
}
#------------------------------------------------------------------------------
 taskNames+=("Install Brackets")
 taskMessages+=("Processing Brackets")
 taskDescriptions+=("Another Text Editor w/ Live Preview")
 taskRecipes+=("installBrackets")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBrackets()
{
  snap install --classic brackets
}
#------------------------------------------------------------------------------
 taskNames+=("Install Simply Fortran")
 taskMessages+=("Processing Simply Fortran")
 taskDescriptions+=("IDE for ForTran")
 taskRecipes+=("installSimplyForTran")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installSimplyFortran()
{
  snap install simplyfortran --classic
}
#------------------------------------------------------------------------------
taskNames+=("Install Eclipse")
taskMessages+=("Processing Eclipse")
taskDescriptions+=("Legendary C/C++ & Java IDE with an extensible tool platform.")
taskRecipes+=("installEclipse")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installEclipse()
{
  snap install eclipse
}
#------------------------------------------------------------------------------
taskNames+=("Install Postman")
taskMessages+=("Processing Postman")
taskDescriptions+=("A development environment for APIs")
taskRecipes+=("installPostman")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installPostman()
{
  snap install postman
}
#------------------------------------------------------------------------------
taskNames+=("Install GitKraken")
taskMessages+=("Processing GitKraken")
taskDescriptions+=("A graphical git client from Axosoft")
taskRecipes+=("installGitKraken")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installGitKraken()
{
  snap install gitkraken
}
#------------------------------------------------------------------------------
taskNames+=("Install Github Desktop")
taskMessages+=("Processing Github Desktop")
taskDescriptions+=("Desktop application for GitHub allowing the user a unified cross platform experience of the OctoCat.")
taskRecipes+=("installGithubDesktop")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installGithubDesktop()
{
  snap install github-desktop --beta --classic
}
#------------------------------------------------------------------------------
taskNames+=("Install E-Tools")
taskMessages+=("Processing E-Tools")
taskDescriptions+=("A toolbox for developers. Code formatter, color picker and more!")
taskRecipes+=("installETools")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installETools()
{
  snap install e-tools
}
#------------------------------------------------------------------------------
 taskNames+=("Install Coulr")
 taskMessages+=("Processing Coulr")
 taskDescriptions+=("A pleasant little color picker program")
 taskRecipes+=("installCoulr")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installCoulr()
{
 snap install coulr
 }
 #------------------------------------------------------------------------------
 taskNames+=("Install Kotlin")
 taskMessages+=("Processing Kotlin")
 taskDescriptions+=("JetBrainz in-house Language")
 taskRecipes+=("installKotlin")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installKotlin()
{
snap install kotlin --classic
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Kotlin-Native")
 taskMessages+=("Processing Kotlin-Native")
 taskDescriptions+=("Kotlin for Mobile")
 taskRecipes+=("installKotlinNative")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installKotlinNative()
{
 snap install kotlin-native --classic
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Go")
 taskMessages+=("Processing Go")
 taskDescriptions+=("Language, Google's Answer to JS")
 taskRecipes+=("installGo")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installGo()
{
 snap install go --channel=1.11/stable --classic
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Ruby")
 taskMessages+=("Processing Ruby")
 taskDescriptions+=("Language for Back End Use Primarily")
 taskRecipes+=("installRuby")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installRuby()
{
snap install ruby --classic
 }
 #------------------------------------------------------------------------------
 taskNames+=("Install NVM & Node")
 taskMessages+=("Processing NVM & Node")
 taskDescriptions+=("Language, Google's Answer to JS")
 taskRecipes+=("installNVM")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installNVM()
{
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node
 }

#------------------------------------------------------------------------------
 taskNames+=("Install Geary")
 taskMessages+=("Processing Geary")
 taskDescriptions+=("The GNOME Mail Client")
 taskRecipes+=("installGeary")
 taskPostInstallations+=("")
 taskSelectedList+=("False")
installGeary()
{
  addPackage "geary"
}
#------------------------------------------------------------------------------
 taskNames+=("Install Electron Mail")
 taskMessages+=("Processing Electron Mail")
 taskDescriptions+=("An email client for Protonmail and Tutanota providing end to end encryption")
 taskRecipes+=("installElectronMail")
 taskPostInstallations+=("")
 taskSelectedList+=("False")
installElectronMail()
{
  snap install electron-mail
}
#------------------------------------------------------------------------------
 taskNames+=("Install Prospect Mail")
 taskMessages+=("Processing Prospect Mail")
 taskDescriptions+=("Access Microsoft Mail Account's OutLook Mail")
 taskRecipes+=("installProspectMail")
 taskPostInstallations+=("")
 taskSelectedList+=("False")
installProspectMail()
{
  snap install prospect-mail
}
#------------------------------------------------------------------------------
taskNames+=("Install utilities bundle")
taskMessages+=("Processing utilities bundle")
taskDescriptions+=("Java, zip, rar and exfat tools")
taskRecipes+=("installUtilities")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")
installUtilities()
{
  addPackage "icedtea-8-plugin openjdk-8-jre p7zip rar exfat-fuse exfat-utils unzip rzip wzip ziptool plzip minizip minilzip gtk2-engines-pixbuf gtk2-engines-murrine gzip unace unrar-free ntfs-3g ntfs-config libfsntfs1 lzip python-avahi avahi-autoipd libnet-rendezvous-publish-backend-avahi-perl avahi-autoipd avahi-utils avahi-dnsconfd avahi-ui-utils p7zip-full jlha-utils lzip lunzip bzip2 clzip libboost-dev libboost-serialization-dev libboost-filesystem-dev liboost-dev libboost-system-dev"
}
#------------------------------------------------------------------------------
taskNames+=("Install developer bundle")
taskMessages+=("Processing developer bundle")
taskDescriptions+=("Tools for developers: build-essential, cmake, git, svn, java, python, octave, autotools...")
taskRecipes+=("installDevBundle")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")
installDevBundle()
{
addPackage "build-essential cmake cmake-gui cmake-curses-gui python python3 octave gfortran git git-svn subversion kdiff3 colordiff openjdk-8-jdk autoconf autotools-dev cppcheckpastebinit autogen shutter cmake git curl gtk2-engines-pixbuf gtk2-engines-murrine gzip unace unrar-free ntfs-3g ntfs-config libfsntfs1 ssh python-pip python3-pip gpaste svn2git subversion-tools  ssvnc backupninja"
}
#------------------------------------------------------------------------------
 taskNames+=("Install Virtualization Bundle")
 taskMessages+=("Processing Virtualization Bundle")
 taskDescriptions+=("Install Applications Useful for Virtualization")
 taskRecipes+=("installVirtualization")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installVirtualization()
{
addPackage "vde2 tk8.6 tk tcl8.6 tcl libtk8.6 qemu-kvm aqemu overlayroot open-vm-tools virt-viewer libvirt0 fonts-ubuntu-console ethtool bridge-utils virtinst augeas-lenses augeas-tools binfmt-support ca-certificates-mono  camlp4 cli-common gir1.2-libvirt-sandbox-1.0 ledit libaugeas0 libcamlp4-ocaml-dev libfindlib-ocaml libfindlib-ocaml-dev libgdiplus libgfapi0 libgfrpc0 libgfxdr0 libglusterfs0 libmono-btls-interface4.0-cil libmono-corlib4.5-cil libmono-i18n-west4.0-cil libmono-i18n4.0-cil libmono-security4.0-cil libmono-system-configuration4.0-cil libmono-system-core4.0-cil libmono-system-data4.0-cil libmono-system-drawing4.0-cil libmono-system-enterpriseservices4.0-cil libmono-system-numerics4.0-cil libmono-system-security4.0-cil libmono-system-transactions4.0-cil libmono-system-xml4.0-cil libmono-system4.0-cil libpq-dev libpq5 libsanlock-client1 libsqlite3-dev libtirpc-common libtirpc3 libvirt-daemon-driver-storage-gluster libvirt-daemon-driver-storage-zfs libvirt-dev libvirt-doc libvirt-glib-1.0-dev libvirt-ocaml libvirt-ocaml-dev libvirt-sandbox-1.0-5 libvirt-sandbox-1.0-dev libvirt-sanlock libvirt-wireshark libvirtodbc0 libvirtualpg-dev libvirtualpg0 libvirtuoso5.5-cil libxen-dev mono-4.0-gac mono-gac mono-runtime mono-runtime-common mono-runtime-sgen ocaml-base-nox ocaml-compiler-libs ocaml-findlib ocaml-interp ocaml-nox odbcinst odbcinst1debian2 virtuoso-opensource-6.1-common postgresql-doc-11 devhelp ocaml-doc tuareg-mode tcl-tclreadline vde2-cryptcab "
 }
 #------------------------------------------------------------------------------
 taskNames+=("Install X11 Utilities")
 taskMessages+=("Processing x11 Utilities")
 taskDescriptions+=("Display Stuff Over SSH")
 taskRecipes+=("installX11")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installX11()
{
addPackage "x11-session-utils xtv x11-apps x11vnc xserver-xorg-video-all x11-utils x11-common x11-xserver-utils freerdp-x11 x11vnc-data libx11-freedesktop-desktopentry-perl tigervnc-xorg-extension xserver-xorg-video-all freerdp2-x11 freerdp2-shadow-x11 xorg"
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
# TASK TEMPLATE
#------------------------------------------------------------------------------
# taskNames+=("<Task Name>")
# taskMessages+=("<Task message>")
# taskDescriptions+=("<Task description>")
# taskRecipes+=("<Task recipe function>")
# taskPostInstallations+=("<Task post-installation function>")
# taskSelectedList+=("Task boolean value")
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
# END OF TASK LIST ############################################################
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

# Main function
function main()
{
# Add Snap Package Functionality
addPackage "snapd"
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


  # Check if Zenity package is installed
  if ! $(checkPackage zenity); then
    installPackage "zenity"
  fi


  # Test connectivity
  if ! ping -c 1 google.com >> /dev/null 2>&1; then
    zenity --error --title="colt45" --text="There is no connection to the Internet. Please connect and then launch colt45 again."
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
      --height 1280 \
      --width 1280 \
      --title="colt45" \
      --text "Select packages to install:" \
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
      zenity --info --title="colt45" --text "No tasks were selected"
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
    message="The selected tasks will be performed now. "
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

  chown "$SUDO_USER":"$SUDO_USER" $errorLog
  chown "$SUDO_USER":"$SUDO_USER" $debugLog

  # Perform all tasks
  (
    errors=false

    for i in "${!taskNames[@]}"; do
      if [[ $tasks == *"${taskNames[i]}"* ]]; then

        echo -e "# Processing recipes... [${taskMessages[i]}]"

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
        su "$SUDO_USER" -c 'notify-send -i utilities-terminal colt45 "All tasks completed successfully"'
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

      zenity --list --height 500 --width 500 --title="colt45" \
             --text="$message" \
             --hide-header --column "Tasks with errors" "${errorList[@]}"

      message="Error!Error!Error!Error!Error!Error!Error!Error!Error!Error!\n"
      message+="-------------------------------------------------------------"
      message+="---------------------------------------------------------\n\n"

      echo -e "$message$(tail -n "$startLine" "$errorLog")" |
      zenity --text-info --height 800 --width 800 --title="colt45"
    fi
  fi
}
# End of main function


function packageIsInstalled()
{
  LANG=C
  apt-cache policy "$1" | grep "Installed: (none)" &> /dev/null

  if [[ $? == 0 ]]; then
    echo false
  else
    echo true
  fi
}


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

exit 0
