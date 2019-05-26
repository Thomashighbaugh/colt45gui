#!/bin/bash
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
  sudo snap install brave --classic
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
  sudo snap install --classic vagrant
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
sudo snap install ubuntu-make --classic
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
sudo snap install doctl --classic
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
sudo snap install aws-ctl --classic
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
sudo snap install fkill --classic
 }
 postFKILL()
{
sudo snap connect fkill:process-control :process-control
sudo snap connect fkill:system-observe :system-observel
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
sudo snap install nextcloud
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
sudo snap install nextcloud-client
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
  sudo snap install yakyak
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
  sudo snap install flock-chat
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
  sudo snap install zulip
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
  sudo snap install vlc
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
sudo snap install clementine
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
sudo snap install poddr
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
sudo snap install bitwarden
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
 taskNames+=("Install Simple Note")
 taskMessages+=("Processing Simple Note")
 taskDescriptions+=("A 'simple' note taker, decent replacement for Giganotes or EverNote")
 taskRecipes+=("installSimpleNote")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installSimpleNote()
{
sudo snap install simplenote
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
sudo snap install qownnotes
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
sudo snap install micropad
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
sudo snap install outwiker --beta
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
 taskNames+=("Install Sublime Text")
 taskMessages+=("Basic Code Writing Program")
 taskDescriptions+=("installSublime")
 taskRecipes+=("installSublime")
 taskPostInstallations+=("")
 taskSelectedList+=("Task boolean value")
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
# END OF TASK LIST ############################################################
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
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
      --height 720 \
      --width 1280 \
      --title="colt45" \
      --text "Select tasks to perform:" \
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
        su "$SUDO_USER" -c 'notify-send -i utilities-terminal colt45 "All tasks completed succesfully"'
      fi
    fi
  ) |
  zenity --progress \
         --pulsate \
         --no-cancel \
         --title="colt45" \
         --text="Processing all tasks" \
         --percentage=0 \
         --height 100 \
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
      zenity --text-info --height 700 --width 800 --title="colt45"

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
