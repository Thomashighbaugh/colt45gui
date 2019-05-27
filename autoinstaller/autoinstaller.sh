#!/usr/bin/env bash
#-------------------------------------------------------------
# Author: Thomas Leon Highbaugh
# Title: colt45 AutoInstaller
# Description: For use with chroot environments and other situations in which
# using a GUI is not feasible
#-------------------------------------------------------------

#-------------------------------------------------------------
# INITIALIZATION
#-------------------------------------------------------------
apt-get update
apt-get upgrade -y
apt-get autoremove
add-apt-repository ppa:cubic-wizard/release -y

#-------------------------------------------------------------
# Packages
#-------------------------------------------------------------

apt-get install -y x11-session-utils xtv x11-apps x11vnc xserver-xorg-video-all x11-utils x11-common x11-xserver-utils freerdp-x11 x11vnc-data libx11-freedesktop-desktopentry-perl tigervnc-xorg-extension xserver-xorg-video-all freerdp2-x11 freerdp2-shadow-x11 xorg

apt-get install -y vde2 libvirt-bin tk8.6 tk tcl8.6 tcl libtk8.6 qemu-kvm aqemu overlayroot open-vm-tools virt-viewer libvirt0 fonts-ubuntu-console ethtool bridge-utils virtinst virt-manager

apt-get install -y build-essential cmake cmake-gui cmake-curses-gui python python3 octave gfortran git git-svn subversion kdiff3 colordiff openjdk-8-jdk autoconf autotools-dev cppcheckpastebinit autogen shutter cmake git curl gtk2-engines-pixbuf gtk2-engines-murrine gzip unace unrar-free ntfs-3g ntfs-config libfsntfs1 ssh python-pip python3-pip gpaste svn2git subversion-tools  ssvnc backupninja

apt-get install -y icedtea-8-plugin openjdk-8-jre p7zip rar exfat-fuse exfat-utils unzip rzip wzip ziptool plzip minizip minilzip gtk2-engines-pixbuf gtk2-engines-murrine gzip unace unrar-free ntfs-3g ntfs-config libfsntfs1 lzip python-avahi avahi-autoipd libnet-rendezvous-publish-backend-avahi-perl avahi-autoipd avahi-utils avahi-dnsconfd avahi-ui-utils p7zip-full jlha-utils lzip lunzip bzip2 clzip libboost-dev libboost-serialization-dev libboost-filesystem-dev liboost-dev libboost-system-dev

apt-get install -y alacarte gparted browser-plugin-vlc libvlc-bin libvlc5 libvlccore9 vlc-bin vlc-data vlc-plugin-access-extra vlc-plugin-base vlc-plugin-video-output vlc-plugin-qt

apt-get install -y cubic gnome-system-monitor cockpit-dashboard cockpit-docker cockpit-networkmanager cockpit-packagekit cockpit-bridge cockpit

#-------------------------------------------------------------
# Snap Packages
#-------------------------------------------------------------

snap install ruby --classic
snap install go --channel=1.11/stable --classic
snap install kotlin-native --classic
snap install kotlin --classic
snap install mdbook
snap install outwiker --beta

 snap install spotify
apt update

 snap install kata-containers --classic


