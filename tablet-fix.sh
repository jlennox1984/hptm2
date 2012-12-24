#!/bin/bash
echo "this is for HP TX2 Smart Tablet video fix\n"
read -p "do You have a ATI READON 2xxx -4XXXX (y/n)"  REPLY
if test "$REPLY" = "y" ||"$REPLY" = "Y"

then

    sudo add-apt-repository ppa:makson96/fglrx
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install fglrx-legacy
else
    echo "you do not need this"

fi

echo "#################\n#FIX SOUND                 #\n########################\n"
sudo add-apt-repository ppa:ubuntu-audio-dev/ppa; sudo apt-get update;sudo apt-get dist-upgrade; sudo apt-get install pavucontrol linux-sound-base alsa-base alsa-utils gdm ubuntu-desktop  linux-image-`uname -r` libasound2; sudo apt-get -y --reinstall install linux-sound-base alsa-base alsa-utils gdm ubuntu-desktop  linux-image-`uname -r` libasound2; killall pulseaudio; rm -r ~/.pulse*; sudo usermod -aG `cat /etc/group | grep -e '^pulse:' -e '^audio:' -e '^pulse-access:' -e '^pulse-rt:' -e '^video:' | awk -F: '{print $1}' | tr '\n' ',' | sed 's:,$::g'` `whoami`
  

