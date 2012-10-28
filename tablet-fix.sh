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
