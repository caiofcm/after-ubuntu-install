#!/bin/bash

# General

sudo apt update
sudo apt upgrade
sudo apt install build-essential
sudo apt install gnome-tweak-tool
sudo apt install chrome-gnome-shell
sudo apt install ubuntu-restricted-addons
sudo apt install ubuntu-restricted-extras
sudo apt install vlc
sudo apt install unrar zip unzip p7zip-full p7zip-rar rar
sudo apt install wine64 wine32 winetricks
sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
sudo apt install curl git vim xclip

## Chrome
sudo apt install libxss1 libappindicator1 libindicator7
if [ ! -f 'google-chrome-stable_current_amd64.deb' ]; then
    echo " Downloading Chrome "
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
fi
sudo apt install ./google-chrome*.deb

## Nemo
sudo add-apt-repository ppa:embrosyn/cinnamon
sudo apt install nemo
# Check extensions: apt-cache search nemo
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false

## OH-my-zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo apt-get install fonts-powerline
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' .zshrc

### For Properly working on VsCode intergraded terminal:
# Ref: https://github.com/powerline/fonts
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
## Add the following to vscode settings:
# "terminal.integrated.fontFamily": "'Inconsolata-g for Powerline'",

## Timeshift (try it)
sudo add-apt-repository -y ppa:teejee2008/ppa
sudo apt-get update
sudo apt-get install timeshift

## Laptop
sudo apt-get install laptop-mode-tools

## For monitor extension
sudo apt install gir1.2-gtop-2.0 gir1.2-networkmanager-1.0  gir1.2-clutter-1.0
sudo apt install gir1.2-clutter-1.0 gir1.2-clutter-gst-3.0 gir1.2-gtkclutter-1.0
sudo apt install nvidia-smi

## Generate ssh key
if [ ! -f "$HOME"/.ssh/id_rsa.pub ]; then
    ssh-keygen -t rsa -b 4096 -C "caiocuritiba@gmail.com"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    # this should be added to github or gitlab, etc, 
    #for instance using: xclip -sel clip < ~/.ssh/id_rsa.pub
fi

sudo apt-get autoremove

# Programming

## VSCode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code # or code-insiders
xdg-mime default code.desktop text/plain #set as default text

## Python
bash install_latest_anaconda.sh

## Java
sudo apt-get install openjdk-8-jdk

## Node
sudo apt-get install nodejs-dev node-gyp libssl1.0-dev npm

## Softwares/Utilities

### Parcellite
sudo add-apt-repository ppa:rickyrockrat/parcellite-appindicator
sudo apt-get update; sudo apt-get install parcellite
# Remember: CTRL+Alt+P -> Preferences -> Hot keys -> Histyory key combinations -> change H to V

### Teamviewer
if [ ! -f 'teamviewer_amd64.deb' ]; then
    echo " Downloading and Installing Teamviewer "
    wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
    sudo apt install ./teamviewer_amd64.deb
fi

sudo apt install inkscape

# Network
sudo apt install gufw
sudo ufw enable

## Tplink driver
#sudo apt install rtl8812au-dkms
# This one worked for me: 
#http://archive.ubuntu.com/ubuntu/pool/universe/r/rtl8812au/rtl8812au-dkms_4.3.8.12175.20140902+dfsg-0ubuntu8_all.deb
# After stopped working I installed this one and things were fixed, so next time just
# sudo dpkg -i rtl8812au*.deb in the ~/Downloads folder

## WORKED IN LINUX MINT
# FOLLOW INSTRUCTIONS FROM: https://github.com/gnab/rtl8812au

# KEYBOARD WORKING IN LINUX MINT
# > US, intl. with dead keys
# cedilla:
# add compose key: https://forums.linuxmint.com/viewtopic.php?t=286923
# instructions also here: https://askubuntu.com/questions/1008071/how-to-write-in-brazilian-portuguese-using-a-us-keyboard

# Configurations
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell favorite-apps "['nemo.desktop', 'code.desktop', 'google-chrome.desktop']"

## Add to .zshrc
if [ ! $(grep -Fxq "xset led on" .zshrc) ]; then
    echo "\n# Turn led on\nxset led on" >> .zshrc
fi

## Keyboard shortcuts
#' Using the Script from: https://askubuntu.com/questions/597395/how-to-set-custom-keyboard-shortcuts-from-terminal
if [ -f 'set_custom_shortcut_ubuntu.py' ]; then
    echo " Setting keyboards ... "
    python3 ./set_custom_shortcut_ubuntu.py 'open nemo' 'nemo' '<Super>E'
fi

# Extensions Manual installation
#' Check here for automation: https://linuxconfig.org/how-to-install-gnome-shell-extensions-from-zip-file-using-command-line-on-ubuntu-18-04-bionic-beaver-linux
#' https://extensions.gnome.org/extension/ -> allow 
#' Installed:e
#' - https://extensions.gnome.org/extension/1031/topicons/
#' - https://extensions.gnome.org/extension/750/openweather/
#' - https://extensions.gnome.org/extension/120/system-monitor/

echo "Done!"
