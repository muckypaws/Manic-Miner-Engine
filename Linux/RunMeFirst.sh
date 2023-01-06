#!/bin/bash

#############################################
#
# Run This Script First After Copying Files
# To your Linux Device.
#
#############################################

# Quit if Error
set -e

echo "============================================"
echo -e "            \033[0;91mManic Miner for Linux\033[0m"
echo "============================================"
echo -e " Created by Jason Brooks - \033[0;36mwww.wonkypix.com\033[0m "
echo ""
echo " Changing Ownership to $(id -u):$(id -g) "
echo ""
echo "============================================"
echo ""

sudo chown $(id -u):$(id -g) ~/ManicMiner/. -R

echo "============================================"
echo -e " \033[0;91mChecking Packages\033[0m "
echo ""
echo "============================================"
echo ""

# You should have some of the following installed already, but will check anyway.
OBJECTS=("libopenal-dev" "libpng-dev" "libjpeg-dev" "xorg-dev" "libglu1-mesa-dev" "libudev-dev")

for FILES in ${OBJECTS[@]}
do
  if ! dpkg -s $FILES &> /dev/null; then
    echo ""
    echo -e "$FILES => \033[0;91mnot found\033[0m"
    echo ""
    echo "Installing $FILES now..."
    echo ""
    sudo apt-get --yes install $FILES
  else 
    echo -e "$FILES => \033[0;92mfound\033[0m"
  fi
done

echo "============================================"
echo -e " \033[0;91mChanging To Executable\033[0m "
echo ""
echo "============================================"
echo ""

chmod +x ~/ManicMiner/ManicMiner* 

# Determine which Binary to Use 32 or 64Bit
bits=`getconf LONG_BIT`

mmexec="ManicMinerLinux"$bits
./$mmexec




