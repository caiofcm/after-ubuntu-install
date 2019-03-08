#!/bin/bash

## Python
#cd /tmp

DOWNLOAD_URL=$(wget -O - https://www.anaconda.com/distribution/ 2>/dev/null | sed -ne 's@.*\(https:\/\/repo\.anaconda\.com\/archive\/Anaconda3-.*-Linux-x86_64\.sh\)\">64-Bit (x86) Installer.*@\1@p') 

INSTALL_FILE_NAME=$(echo $DOWNLOAD_URL | sed -ne 's@.*\(Anaconda3-.*-Linux-x86_64\.sh\)@\1@p')

#$what= sed -i "s/$DOWNLOAD_URL/ZZ/g" "Anaconda"

#echo $what

# Download
if [ ! -f $INSTALL_FILE_NAME ]; then
    echo " Downloading >> " $DOWNLOAD_URL
    wget $DOWNLOAD_URL
fi

# Install
bash $INSTALL_FILE_NAME

