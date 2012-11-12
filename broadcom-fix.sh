#!/bin/bash
echo "This is a broadcom fix for bcm43x it enabled N networks\n"
 mkdir broadcom-fix
cd broadcom-fix

read -p "what archticture do you have 32 or 64-> " ARCH

if test "$ARCH" = "64"

then
	wget http://www.broadcom.com/docs/linux_sta/hybrid-portsrc_x86_64-v5_100_82_112.tar.gz

elif test "$ARCH" = "32"
then
	wget http://www.broadcom.com/docs/linux_sta/hybrid-portsrc_x86_32-v5_100_82_112.tar.gz
else
 	 echo "please select Your Archtiture"
	cd ..
	rm -rf broadcom-fix/
	 exit
fi
	#Extract driver 
	tar -zxvf hybrid-portsrc_* 	
	# Download patchs
	wget http://www.mindwerks.net/wp-content/uploads/2011/11/bc_wl_abiupdate.patch
	wget http://www.mindwerks.net/wp-content/uploads/2012/06/switch_to.patch
	patch -p0 src/wl/sys/wl_linux.c < switch_to.patch;
	patch -p0 src/wl/sys/wl_linux.c < bc_wl_abiupdate.patch;
	 
	 make
	 sudo make install;
	 sudo depmod; 
	 sudo modprobe wl 
	rm -rf broadcom-fix
	echo "Done You should now be able to access wifi N Networks with speed"
