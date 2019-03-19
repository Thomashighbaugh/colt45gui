echo "########################################################################"
echo "Author: Thomas Leon Highbaugh aka TLH"
echo "colt45 Auto Installer for"
echo "Ubuntu Based Systems"
echo "########################################################################"
echo "This software is Free to Use With Attribution in any context. It comes with no guarentee of anything except that if you are reading this you are a complete nerd or paranoid (or mnaybe both)"
echo "########################################################################"
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
taskNames+=("Install automatic drivers")
taskMessages+=("Processing drivers")
taskDescriptions+=("Install drivers that are appropriate for automatic installation")
taskPostInstallations+=("")
taskRecipes+=("autoInstallDrivers")
taskSelectedList+=("FALSE")

autoInstallDrivers()
{
  ubuntu-drivers autoinstall
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
taskNames+=("Install Chrome")
taskMessages+=("Processing Chrome")
taskDescriptions+=("The web browser from Google")
taskRecipes+=("installChrome")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installChrome()
{
  if [[ $OSarch == "x86_64" ]]; then
      installPackage "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
  else
      >&2 echo "Your system is not supported by Google Chrome"
      return 1
  fi
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
  echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
  addPackage "chromium-browser"
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
  addRepo "ppa:ubuntu-mozilla-security/ppa"
  addPackage "firefox firefox-locale-$(locale | grep LANGUAGE | cut -d= -f2 | cut -d_ -f1)"
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
  echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
  echo opera-stable opera-stable/add-deb-source boolean true | debconf-set-selections

  if [[ $OSarch == "x86_64" ]]; then
    wget -O /tmp/opera.deb "https://download1.operacdn.com/pub/opera/desktop/52.0.2871.40/linux/opera-stable_52.0.2871.40_amd64.deb"
  else
    wget -O /tmp/opera.deb "https://download1.operacdn.com/pub/opera/desktop/52.0.2871.40/linux/opera-stable_52.0.2871.40_i386.deb"
  fi
  
  DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/opera.deb # Needs dpkg and variable set to avoid prompt
  rm /tmp/opera.deb
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
  addRepo "ppa:transmissionbt/ppa"
  addPackage "transmission-gtk"
}
#------------------------------------------------------------------------------
taskNames+=("Install Dropbox")
taskMessages+=("Processing Dropbox")
taskDescriptions+=("A cloud hosting service to store your files online")
taskRecipes+=("installDropbox")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installDropbox()
{
  # Handle elementary OS with wingpanel support
  if [[ $OSname == "elementary" ]]; then
    installPackage git
    apt-get --purge remove -y dropbox*
    installPackage python-gpgme
    git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
    bash /tmp/elementary-dropbox/install.sh -y
  else
    if [[ $OSarch == "x86_64" ]]; then
        wget -O /tmp/dropbox.tar.gz "https://www.dropbox.com/download?plat=lnx.x86_64"
    else
        wget -O /tmp/dropbox.tar.gz "https://www.dropbox.com/download?plat=lnx.x86"
    fi

    tar -xvzf /tmp/dropbox.tar.gz -C /home/"$SUDO_USER"
    /.dropbox-dist/dropboxd
  fi
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
  addPackage "virtualbox"
addPackage "virtualbox-qt" 
addPackage "virtualbox-ext-pack" 
addPackage "virtualbox-dkms" 
addPackage "virtualbox-guest-utils"  
addPackage "virtualbox-guest-x11" 
addPackage "virtualbox-guest-source"
}
#------------------------------------------------------------------------------
taskNames+=("Install Skype")
taskMessages+=("Processing Skype")
taskDescriptions+=("A videocall software from Microsoft")
taskRecipes+=("installSkype")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installSkype()
{
  installPackage "https://go.skype.com/skypeforlinux-64.deb"
}
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
taskNames+=("Install Telegram")
taskMessages+=("Processing Telegram")
taskDescriptions+=("A chat client, similar to Whatsapp, Viber, Facebook Messenger or Google Hangouts")
taskRecipes+=("installTelegram")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installTelegram()
{
  if [[ $OSarch == "x86_64" ]]; then
    wget -O - https://telegram.org/dl/desktop/linux > /tmp/telegram.tar.xz
  else
    wget -O - https://telegram.org/dl/desktop/linux32 > /tmp/telegram.tar.xz
  fi

  tar -xf /tmp/telegram.tar.xz -C /opt

  chmod +x /opt/Telegram/Telegram
  chown -R "$SUDO_USER:$SUDO_USER" /opt/Telegram/

  wget -q -o /opt/Telegram/icon.png https://desktop.telegram.org/img/td_logo.png

  desktopFile="/home/$SUDO_USER/.local/share/applications/telegram.desktop"

  echo "[Desktop Entry]" > "$desktopFile"
  echo "Name=Telegram" >> "$desktopFile"
  echo "GenericName=Chat" >> "$desktopFile"
  echo "Comment=Chat with yours friends" >> "$desktopFile"
  echo "Exec=/opt/Telegram/Telegram" >> "$desktopFile"
  echo "Terminal=false" >> "$desktopFile"
  echo "Type=Application" >> "$desktopFile"
  echo "Icon=/opt/Telegram/icon.png" >> "$desktopFile"
  echo "Categories=Network;Chat;" >> "$desktopFile"
  echo "StartupNotify=false" >> "$desktopFile"
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
  addRepo "ppa:videolan/stable-daily"
  addPackage "vlc"
}
#------------------------------------------------------------------------------
taskNames+=("Install Kazam")
taskMessages+=("Processing Kazam")
taskDescriptions+=("A tool to record your screen and take screenshots")
taskRecipes+=("installKazam")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installKazam()
{
  addPackage "kazam"
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
  addRepo "ppa:stebbins/handbrake-releases"
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
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410

  if [[ ! -f /etc/apt/sources.list.d/spotify.list ]]; then
    echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list
  fi

  addPackage "spotify-client"
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
taskNames+=("Install Mixxx")
taskMessages+=("Processing Mixxx")
taskDescriptions+=("A MP3 DJ mixing software")
taskRecipes+=("installMixxx")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installMixxx()
{
  addRepo "ppa:mixxx/mixxx"
  addPackage "mixxx"
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
  addRepo "ppa:thomas-schiex/blender"
  addPackage "blender"
}
#------------------------------------------------------------------------------
taskNames+=("Install Freecad")
taskMessages+=("Processing Freecad")
taskDescriptions+=("An open-source parametric 3D modeler")
taskRecipes+=("installFreecad")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installFreecad()
{
  addRepo "ppa:freecad-maintainers/freecad-stable"
  addPackage "freecad"
}
#------------------------------------------------------------------------------
taskNames+=("Install LeoCad")
taskMessages+=("Processing LeoCad")
taskDescriptions+=("Virtual LEGO CAD software")
taskRecipes+=("installLeoCad")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installLeoCad()
{
  installPackage "unzip"

  wget -q -O /tmp/ldraw.zip http://www.ldraw.org/library/updates/complete.zip
  unzip /tmp/ldraw.zip -d /home/"$SUDO_USER"

  addPackage "leocad"
}
#------------------------------------------------------------------------------
taskNames+=("Install LibreOffice suite")
taskMessages+=("Processing LibreOffice")
taskDescriptions+=("A complete office suite: word processor, spreadsheets, slideshows, diagrams, drawings, databases and equations")
taskRecipes+=("installLibreOffice")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installLibreOffice()
{
  addPackage "libreoffice libreoffice-l10n-$lang"
}
#------------------------------------------------------------------------------
taskNames+=("Install LibreOffice Writer")
taskMessages+=("Processing LibreOffice Writer")
taskDescriptions+=("Install just the LibreOffice word processor")
taskRecipes+=("installLibreOfficeWriter")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installLibreOfficeWriter()
{
  addPackage "libreoffice-writer libreoffice-l10n-$lang"
}
#------------------------------------------------------------------------------
taskNames+=("Install LibreOffice Impress")
taskMessages+=("Processing LibreOffice Impress")
taskDescriptions+=("Install just the LibreOffice slide show editor")
taskRecipes+=("installLibreOfficeImpress")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installLibreOfficeImpress()
{
  addPackage "libreoffice-impress libreoffice-l10n-$lang"
}
#------------------------------------------------------------------------------
taskNames+=("Install LibreOffice Spreadsheet")
taskMessages+=("Processing LibreOffice Spreadsheet")
taskDescriptions+=("Install just the LibreOffice spreadsheet editor")
taskRecipes+=("installLibreOfficeSpreadsheet")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installLibreOfficeSpreadsheet()
{
  addPackage "libreoffice-calc libreoffice-l10n-$lang"
}
#------------------------------------------------------------------------------
taskNames+=("Install LibreOffice Draw")
taskMessages+=("Processing LibreOffice Draw")
taskDescriptions+=("Install just the LibreOffice drawing editor")
taskRecipes+=("installLibreOfficeDraw")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installLibreOfficeDraw()
{
  addPackage "libreoffice-draw libreoffice-l10n-$lang"
}
#------------------------------------------------------------------------------
taskNames+=("Install LibreOffice Base")
taskMessages+=("Processing LibreOffice Base")
taskDescriptions+=("Install just the LibreOffice database manager")
taskRecipes+=("installLibreOfficeBase")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installLibreOfficeBase()
{
  addPackage "libreoffice-base libreoffice-l10n-$lang"
}
#------------------------------------------------------------------------------
taskNames+=("Install LibreOffice Math")
taskMessages+=("Processing LibreOffice Math")
taskDescriptions+=("Install just the LibreOffice equation editor")
taskRecipes+=("installLibreOfficeMath")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installLibreOfficeMath()
{
  addPackage "libreoffice-math libreoffice-l10n-$lang"
}
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
taskNames+=("Install Master PDF Editor")
taskMessages+=("Processing Master PDF Editor")
taskDescriptions+=("A convenient and smart PDF editor for Linux")
taskRecipes+=("installMasterPDF")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installMasterPDF()
{
  if [[ $OSarch == "x86_64" ]]; then
    installPackage "http://get.code-industry.net/public/master-pdf-editor-3.7.10_amd64.deb"
  else
    installPackage "http://get.code-industry.net/public/master-pdf-editor-3.7.10_i386.deb"
  fi
}
#------------------------------------------------------------------------------
taskNames+=("Install Jabref")
taskMessages+=("Processing Jabref")
taskDescriptions+=("A graphical editor for bibtex libraries")
taskRecipes+=("installJabref")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installJabref()
{
  addPackage "jabref"
}
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
taskNames+=("Install Steam")
taskMessages+=("Processing Steam")
taskDescriptions+=("A game digital distribution platform developed by Valve")
taskRecipes+=("installSteam")
taskPostInstallations+=("postSteam")
taskSelectedList+=("FALSE")

installSteam()
{
  addRepo "multiverse"
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
taskNames+=("Install 0 A.D.")
taskMessages+=("Processing 0 A.D.")
taskDescriptions+=("0 A.D. is a game of ancient warfare, similar to Age of Empires")
taskRecipes+=("install0AD")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

install0AD()
{
  addPackage "0ad"
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
  if [[ $OSarch == "x86_64" ]]; then
    dpkg --add-architecture i386
  fi

  wget -q -nc -O /tmp/Release.key https://dl.winehq.org/wine-builds/Release.key
  apt-key add /tmp/Release.key
  installRepo "https://dl.winehq.org/wine-builds/ubuntu/"
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
#------------------------------------------------------------------------------
taskNames+=("Install EncFS")
taskMessages+=("Processing EncFS")
taskDescriptions+=("Create and manage encrypted folders to keep your files safe")
taskRecipes+=("installEncFS")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installEncFS()
{
  addRepo "ppa:gencfsm"
  addPackage "gnome-encfs-manager"
}
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
taskNames+=("Install Boost libraries")
taskMessages+=("Processing Boost")
taskDescriptions+=("Boost C++ libraries")
taskRecipes+=("installBoost")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installBoost()
{
  addPackage "libboost-dev libboost-serialization-dev libboost-filesystem-dev liboost-dev libboost-system-dev"
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
  apt-key adv --fetch-keys https://repos.codelite.org/CodeLite.asc
  addRepo "deb http://repos.codelite.org/ubuntu/ $OSbaseCodeName universe"
  addPackage "codelite wxcrafter"
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
  if [[ $OSarch == "x86_64" ]]; then
    installPackage "https://az764295.vo.msecnd.net/stable/79b44aa704ce542d8ca4a3cc44cfca566e7720f1/code_1.21.1-1521038896_amd64.deb"
  else
    installPackage "https://az764295.vo.msecnd.net/stable/79b44aa704ce542d8ca4a3cc44cfca566e7720f1/code_1.21.1-1521038898_i386.deb"
  fi
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
  addRepo "ppa:webupd8team/atom"
  addPackage "atom"
}
#------------------------------------------------------------------------------
taskNames+=("Install Arduino")
taskMessages+=("Processing Arduino")
taskDescriptions+=("The official IDE for the Arduino board")
taskRecipes+=("installArduino")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installArduino()
{
  if [[ $OSarch == "x86_64" ]]; then
    wget -q -O /tmp/arduino.tar.xz https://downloads.arduino.cc/arduino-1.8.5-linux64.tar.xz
  else
    wget -q -O /tmp/arduino.tar.xz https://downloads.arduino.cc/arduino-1.8.5-linux32.tar.xz
  fi

  tar xf /tmp/arduino.tar.xz -C /tmp
  mv /tmp/arduino-1.6.13/ /opt/arduino
  /opt/arduino/install.sh
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
  if [[ $OSarch == "x86_64" ]]; then
    installPackage "https://release.gitkraken.com/linux/gitkraken-amd64.deb"
  else
    >&2 echo "Your system is not supported by Gitkraken"
    return 1
  fi
}
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
#------------------------------------------------------------------------------
taskNames+=("Install SysAdmin bundle")
taskMessages+=("Processing SysAdmin bundle")
taskDescriptions+=("Tools for sysadmins: tmux, cron, screen, ncdu, htop, aptitude, apache, etckeeper, xpra and dconf-editor")
taskRecipes+=("installSysAdminBundle")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installSysAdminBundle()
{
  addPackage "tmux cron screen ncdu htop aptitude apache2 etckeeper xpra dconf-editor exfat-fuse exfat-utils"
}
#------------------------------------------------------------------------------
taskNames+=("Install Exodus")
taskMessages+=("Processing Exodus")
taskDescriptions+=("A blockchain wallet")
taskRecipes+=("installExodus")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installExodus()
{
  wget -q -O /tmp/Exodus.zip https://exodusbin.azureedge.net/releases/exodus-linux-x64-1.48.0.zip

  installPackage "unzip"
  unzip /tmp/Exodus.zip -d /opt/Exodus/

  chown -R "$SUDO_USER":"$SUDO_USER" /opt/Exodus/
  #FIXME: install desktop file
}
#------------------------------------------------------------------------------
taskNames+=("Install Delta")
taskMessages+=("Processing Delta")
taskDescriptions+=("A cryptocurrency portfolio tracker")
taskRecipes+=("installDelta")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installDelta()
{
  wget -q -O /home/"$SUDO_USER"/Delta.AppImage https://static-assets.getdelta.io/desktop_app/Delta-0.9.2-x86_64.AppImage
  chmod +x /home/"$SUDO_USER"/Delta.AppImage
  #FIXME: message the user to execute it
  #bash --rcfile <(echo '. ~/.bashrc; some_command')
}
#------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------
taskNames+=("Install Discord")
taskMessages+=("Processing Discord")
taskDescriptions+=("Gaming voice/chat service")
taskRecipes+=("installDiscord")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installDiscord()
{
  if [[ $OSarch == "x86_64" ]]; then
    installPackage "https://dl.discordapp.net/apps/linux/0.0.4/discord-0.0.4.deb"
  else
    >&2 echo "Your system is not supported by Gitkraken"
    return 1
  fi
}
#------------------------------------------------------------------------------
taskNames+=("Install Tux Guitar")
taskMessages+=("Processing Tux Guitar")
taskDescriptions+=("A tablature editor")
taskRecipes+=("installTuxGuitar")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installTuxGuitar()
{
  addPackage "tuxguitar tuxguitar-alsa tuxguitar-jsa tuxguitar-oss"
}
#------------------------------------------------------------------------------
taskNames+=("Install Ukuu")
taskMessages+=("Processing Ukuu")
taskDescriptions+=("A kernel update tool")
taskRecipes+=("installUkuu")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installUkuu()
{
  addRepo "ppa:teejee2008/ppa"
  addPackage "ukuu"
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
taskNames+=("Install ANoise")
taskMessages+=("Processing ANoise")
taskDescriptions+=("An ambient music player")
taskRecipes+=("installANoise")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installANoise()
{
  addRepo "ppa:costales/anoise"
  addPackage "anoise"
}
#------------------------------------------------------------------------------
taskNames+=("Install Minetest")
taskMessages+=("Processing Minetest")
taskDescriptions+=("A Minecraft clone")
taskRecipes+=("installMinetest")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installMinetest()
{
  addRepo "ppa:minetestdevs/stable"
  addPackage "minetest"
}
#------------------------------------------------------------------------------
taskNames+=("Install Typora")
taskMessages+=("Processing Typora")
taskDescriptions+=("A minimalist text editor")
taskRecipes+=("installTypora")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installTypora()
{
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
  addRepo "deb http://typora.io linux/"
  addPackage "typora"
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
taskNames+=("Install Openshot")
taskMessages+=("Processing Openshot")
taskDescriptions+=("A video editor")
taskRecipes+=("installOpenshot")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installOpenshot()
{
  addRepo "ppa:openshot.developers/ppa"
  addPackage "openshot-qt"
}
#------------------------------------------------------------------------------
taskNames+=("Install Retroarch")
taskMessages+=("Processing Retroarch")
taskDescriptions+=("A retro games emulator frontend")
taskRecipes+=("installRetroarch")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installRetroarch()
{
  addRepo "ppa:libretro/stable"
  addPackage "retroarch"
}
#------------------------------------------------------------------------------
taskNames+=("Install Ulauncher")
taskMessages+=("Processing Ulauncher")
taskDescriptions+=("Application launcher for Linux")
taskRecipes+=("installUlauncher")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installUlauncher()
{
  addRepo "ppa:agornostal/ulauncher"
  addPackage "ulauncher"
}
#------------------------------------------------------------------------------
taskNames+=("Install Jumpapp")
taskMessages+=("Processing Jumpapp")
taskDescriptions+=("Application switcher for Linux")
taskRecipes+=("installJumpapp")
taskPostInstallations+=("")
taskSelectedList+=("FALSE")

installJumpapp()
{
  addRepo "ppa:mkropat/ppa"
  addPackage "jumpapp"
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

 taskNames+=("Install Cacher")
 taskMessages+=("Processing Cacher")
 taskDescriptions+=("A snippet management system")
 taskRecipes+=("installCacher")
 taskPostInstallations+=(" ")
 taskSelectedList+=("false")
#------------------------------------------------------------------------------

installCacher()
{
 snap install cacher
}
 taskNames+=("Install Atom")
 taskMessages+=("Processing Adam")
 taskDescriptions+=("GitHub's Text Editor")
 taskRecipes+=("installAtom")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
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
 taskNames+=("Install Vagrant")
 taskMessages+=("Processing Vagrant")
 taskDescriptions+=("Creates an environment similar to chroot for development")
 taskRecipes+=("installVagrant")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installVagrant(){
addPackage "vagrant"
 }
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
 taskNames+=("Install lxd")
 taskMessages+=("Processing lxd")
 taskDescriptions+=("Docker Alternative // FOSS Containers")
 taskRecipes+=("installlxd")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installlxd(){
snap install lxd --classic
 }
#------------------------------------------------------------------------------
 taskNames+=("Install conjure-up")
 taskMessages+=("Processing conjure-up")
 taskDescriptions+=("Canonical's Half Baked Autoinstaller")
 taskRecipes+=("installconjure-up")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installConjure-Up(){
snap install conjure-up --classic
 }
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
 taskNames+=("Install Kotlin-Native")
 taskMessages+=("Processing Kotlin-Native")
 taskDescriptions+=("Kotlin for Mobile")
 taskRecipes+=("installKotlinNative")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installKotlinNative(){
snap install kotlin-native --classic
 }
#------------------------------------------------------------------------------
 taskNames+=("Install Go")
 taskMessages+=("Processing Go")
 taskDescriptions+=("Language, Google's Answer to JS")
 taskRecipes+=("installGo")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installGo(){
snap install go --channel=1.11/stable --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Ruby")
 taskMessages+=("Processing Ruby")
 taskDescriptions+=("Language for Back End Use Primarily")
 taskRecipes+=("installRuby")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installRuby(){
snap install ruby --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install GRV")
 taskMessages+=("Processing GRV")
 taskDescriptions+=("Git Repo Manipulation from the Command Line")
 taskRecipes+=("installGRV")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installgrv(){
snap install grv
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Brave")
 taskMessages+=("Processing Brave")
 taskDescriptions+=("Secure (supposedly) Browser")
 taskRecipes+=("installBrave")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBrave(){
snap install brave --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Digital Ocean CTL")
 taskMessages+=("Processing Digital Ocean CTL")
 taskDescriptions+=("Command Line Droplet Control")
 taskRecipes+=("installdoctl")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installdoctl(){
snap install doctl --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install AWS CTL")
 taskMessages+=("Processing AWS CTL")
 taskDescriptions+=("Command Line Control of AWS")
 taskRecipes+=("installawsctl")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installawsctl(){
snap install aws-ctl --classic
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Poddr")
 taskMessages+=("Processing Poddr")
 taskDescriptions+=("Podcast Client")
 taskRecipes+=("installPoddr")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installPoddr(){
snap install poddr
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install YakYak")
 taskMessages+=("Processing YakYak")
 taskDescriptions+=("Chat Client")
 taskRecipes+=("installYakYak")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installYakYak(){
snap install yakyak
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Flock Chat")
 taskMessages+=("Processing Flock Chat")
 taskDescriptions+=("Slack Like Chat Application")
 taskRecipes+=("installFlockChat")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installFlockChat(){
snap install flock-chat
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install FKILL")
 taskMessages+=("Processing FKILL")
 taskDescriptions+=("Process Obliterater")
 taskRecipes+=("installFKILL")
 taskPostInstallations+=("postFKILL")
 taskSelectedList+=("false")
installFKILL(){
snap install ruby --classic
 }
 postFKILL(){
sudo snap connect fkill:process-control :process-control
sudo snap connect fkill:system-observe :system-observel
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Instagraph")
 taskMessages+=("Processing Instagraph")
 taskDescriptions+=("Instagram Client")
 taskRecipes+=("installInstagraph")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installInstagraph(){
snap install instagraph
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Gravit Designer")
 taskMessages+=("Processing Gravit Designer")
 taskDescriptions+=("Vector Drawing")
 taskRecipes+=("installGravitDesigner")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installGravitDesigner(){
snap install gravit-designer
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Pencilsheep")
 taskMessages+=("Processing Pencilsheep")
 taskDescriptions+=("GPU optimized image editing (most like Photoshop)")
 taskRecipes+=("installPencilsheep")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installPencilsheep(){
snap install pencilsheep
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Imagenes")
 taskMessages+=("Processing Imagenes")
 taskDescriptions+=("Google Photos on Desktop")
 taskRecipes+=("installImagenes")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installImagenes(){
snap install imagenes
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Mountain Tapir")
 taskMessages+=("Processing Mountain Tapir")
 taskDescriptions+=("Pic Stitcher")
 taskRecipes+=("installMountainTapir")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installMountainTapir(){
snap install mountain-tapir
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Photoscape")
 taskMessages+=("Processing Photoscape")
 taskDescriptions+=("Image Editing")
 taskRecipes+=("installPhotoscape")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installPhotoscape(){
snap install photoscape
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Simple Note")
 taskMessages+=("Processing Simple Note")
 taskDescriptions+=("Note Taker")
 taskRecipes+=("installSimpleNote")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installSimpleNote(){
snap install simplenote
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Nextcloud Client")
 taskMessages+=("Processing Nextcloud Client")
 taskDescriptions+=("Desktop client for Nextcloud")
 taskRecipes+=("installNextcloudClient")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installNextcloudClient(){
snap install nextcloud-client
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install QOwnNotes")
 taskMessages+=("Processing QOwnNotes")
 taskDescriptions+=("Cloud sync ready Note Taker")
 taskRecipes+=("installQOwnNotes")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installQOwnNotes(){
snap install qownnotes
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install MicroPad")
 taskMessages+=("Processing MicroPad")
 taskDescriptions+=("Online-capable Note Taker")
 taskRecipes+=("installMicroPad")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installMicroPad(){
snap install micropad
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Buka")
 taskMessages+=("Processing Buka")
 taskDescriptions+=("Ebook Reader")
 taskRecipes+=("installBuka")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBuka(){
snap install buka
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Outwiker")
 taskMessages+=("Processing Outwiker")
 taskDescriptions+=("Wiki Maker")
 taskRecipes+=("installOutwiker")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installOutwiker(){
snap install outwiker --beta
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Wordpress")
 taskMessages+=("Processing Wordpress")
 taskDescriptions+=("Desktop Application for Wordpress.com")
 taskRecipes+=("installWordpress")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installWordpress(){
snap install wordpress-desktop
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Zenkit")
 taskMessages+=("Processing Zenkit")
 taskDescriptions+=("Project Manager")
 taskRecipes+=("installZenkit")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installZenkit(){
snap install zenkit
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install BitWarden")
 taskMessages+=("Processing BitWarden")
 taskDescriptions+=("Password Manager")
 taskRecipes+=("installBitWarden")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBitWarden(){
snap install bitwarden
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Taskbook")
 taskMessages+=("Processing Taskbook")
 taskDescriptions+=("Command Line Task List")
 taskRecipes+=("installTaskbook")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installTaskbook(){
snap install taskbook
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Heimer")
 taskMessages+=("Processing Heimer")
 taskDescriptions+=("Mind Mapper")
 taskRecipes+=("installHeimer")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installHeimer(){
snap install heimer
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install From Scratch")
 taskMessages+=("Processing From Scratch")
 taskDescriptions+=("Enduring Sticky Notes")
 taskRecipes+=("installFromScratch")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installFromScratch(){
snap install fromscratch
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Ora")
 taskMessages+=("Processing Ora")
 taskDescriptions+=("Project Management Organizer")
 taskRecipes+=("installOra")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installOra(){
snap install ora
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Sticky Notes")
 taskMessages+=("Processing Sticky Notes")
 taskDescriptions+=("Command Line Task List")
 taskRecipes+=("installStickyNotes")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installStickyNotes(){
snap install stickynotes
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Sabnzbd")
 taskMessages+=("Processing Sabnzbd")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installSabnzbd")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installSabnzbd(){
snap install sabnzbd
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install XNviewmp")
 taskMessages+=("Processing XNviewmp")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installXNviewmp")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installXNviewmp(){
snap install xnviewmp
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install krop")
 taskMessages+=("Processing krop")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installkrop")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installkrop(){
snap install krop
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install XNsketch")
 taskMessages+=("Processing XNsketch")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installXNsketch")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installXNsketch(){
snap install xnsketch
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install htop")
 taskMessages+=("Processing htop")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installhtop")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installhtop(){
snap install htop
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install amparepdftoimage")
 taskMessages+=("Processing amparepdftoimage")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installamparepdftoimage")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installamparepdftoimage(){
snap install amparepdftoimage
 }
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install directpdf")
 taskMessages+=("Processing directpdf")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installdirectpdf")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installdirectpdf(){
snap install directpdf
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install CoPay")
 taskMessages+=("Processing CoPay")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installCoPay")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installCoPay(){
snap install CoPay
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install udemy")
 taskMessages+=("Processing udemy")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installudemy")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installudemy(){
snap install udemy
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Raven Reader")
 taskMessages+=("Processing Raven Reader")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installRavenReader")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installRavenReader(){
snap install raven-reader
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Clementine")
 taskMessages+=("Processing Clementine")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installClementine")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installClementine(){
snap install clementine
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install zulip")
 taskMessages+=("Processing zulip")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installzulip")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installzulip(){
snap install zulip
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install BitPay")
 taskMessages+=("Processing BitPay")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installBitPay")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installBitPay(){
snap install bitpay
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Snap Store")
 taskMessages+=("Processing Snap Store")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installSnapStore")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installSnapStore(){
snap install snap-store
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Gnome Software")
 taskMessages+=("Processing Gnome Software")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installGnomeSoftware")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installGnomeSoftware(){
snap install gnome-software --edge --classic
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install CoolReader3")
 taskMessages+=("Processing CoolReader3")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installCoolReader3")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installCoolReader3(){
snap install coolreader3
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install htmldoc")
 taskMessages+=("Processing htmldoc")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installhtmldoc")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installhtmldoc(){
snap install htmldoc
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install oman")
 taskMessages+=("Processing oman")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installoman")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installoman(){
snap install oman
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install mdbook")
 taskMessages+=("Processing mdbook")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installmdbook")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installmdbook(){
snap install mdbook
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install sirrujak-sciencefair")
 taskMessages+=("Processing sirrujak-sciencefair")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installsirrujak-sciencefair")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installsirrujak-sciencefair(){
snap install sirrujak-sciencefair
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install electrum")
 taskMessages+=("Processing electrum")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installelectrum")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installelectrum(){
snap install electrum
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install parity")
 taskMessages+=("Processing parity")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installparity")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installparity(){
snap install parity
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install fetch-btc")
 taskMessages+=("Processing fetch-btc")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installfetch-btc")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installfetch-btc(){
snap install fetch-btc
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install bobrossquotes")
 taskMessages+=("Processing bobrossquotes")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installbobrossquotes")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installbobrossquotes(){
snap install bobrossquotes
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install Coulr")
 taskMessages+=("Processing Coulr")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installCoulr")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installCoulr(){
snap install coulr
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install dosage")
 taskMessages+=("Processing dosage")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installdosage")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installdosage(){
snap install dosage
 }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
 taskNames+=("Install bobrossquotes")
 taskMessages+=("Processing bobrossquotes")
 taskDescriptions+=("Usenet Downloader")
 taskRecipes+=("installbobrossquotes")
 taskPostInstallations+=("")
 taskSelectedList+=("false")
installbobrossquotes(){
snap install bobrossquotes
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

      message="Please notify the following error log at https://github.com/derkomai/colt45/issues\n"
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
