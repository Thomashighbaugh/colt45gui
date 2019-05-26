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
#------------------------------------------------------------------------------
taskNames+=("Install VirtualBox")
taskMessages+=("Processing VirtualBox")
taskDescriptions+=("A virtualization software to run other OSes on top of your current OS")
taskRecipes+=("installVirtualBox")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installVirtualBox()
{
  addPackage "virtualbox"
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
snap install telegram-client
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
#------------------------------------------------------------------------------
taskNames+=("Install Handbrake")
taskMessages+=("Processing Handbrake")
taskDescriptions+=("A video transcoder")
taskRecipes+=("installHandbrake")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installHandbrake()
{
  addPackage "handbrake-gtk handbrake-cli"
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
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
taskNames+=("Install TexMaker")
taskMessages+=("Processing TexMaker")
taskDescriptions+=("A LateX development environment")
taskRecipes+=("installTexMaker")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installTexMaker()
{
  addPackage "texmaker"
}
#------------------------------------------------------------------------------
taskNames+=("Install DiffPdf")
taskMessages+=("Processing DiffPdf")
taskDescriptions+=("Tool to compare PDF files")
taskRecipes+=("installDiffPdf")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installDiffPdf()
{
  addPackage "diffpdf"
}
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
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
taskNames+=("Install utilities bundle")
taskMessages+=("Processing utilities bundle")
taskDescriptions+=("Java, zip, rar and exfat tools")
taskRecipes+=("installUtilities")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installUtilities()
{
  addPackage "icedtea-8-plugin openjdk-8-jre p7zip rar exfat-fuse exfat-utils"
}
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
  addPackage "build-essential cmake cmake-gui cmake-curses-gui python python3 octave gfortran git git-svn subversion kdiff3 colordiff openjdk-8-jdk autoconf autotools-dev cppcheck"
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
