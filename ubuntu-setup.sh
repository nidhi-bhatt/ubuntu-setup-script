#!/bin/bash

#MIT License
#Copyright (c) 2023 Nidhi Bhatt

blue='\033[0;34m'
yellow='\033[0;33m'
red='\033[0;31m'
green='\033[0;32m'
purple='\033[0;35m'
cyan='\033[0;36m'
black='\033[0;30m'



echo " "
function check_root() {
    # Checking for root access and proceed if it is present
    ROOT_UID=0
    if [[ ! "${UID}" -eq "${ROOT_UID}" ]]; then
        # Error message
        echo_error 'Run me as root.'
        echo_info 'try sudo ./ubuntu-setup.sh'
        exit 1
    fi
}

echo " "
echo -e "${cyan}This script is primarily for ubuntu but can be used for other ubuntu based distros like linux mint and also for debian based distros like kali linux as well. It will update/upgrade the system and install recommended software!"

echo " "
echo -e "${blue}Updating system..." 
echo " "
sudo apt update -y && sudo apt upgrade -y

echo " "
echo -e "${purple}Installing neofetch..." 
echo " "
sudo apt install neofetch

echo " "
echo -e "${green}Enabling firewall..."
echo " "
sudo apt update
sudo ufw enable


echo " "
echo -e "${yellow}Improving battery life..." 
echo " "
sudo apt-get install tlp tlp-rdw
sudo systemctl enable tlp
sudo tlp start

echo " "
echo -e "${green}Installing multimedia codecs..." 
echo " "
sudo add-apt-repository multiverse
sudo apt update -y
sudo apt install ubuntu-restricted-extras

echo " "
read -p $'\e[36mDo you have GNOME Desktop Environment (Ubuntu has gnome desktop environment by default) [y/n]\e[0m ' val
if [ "$val" = "y" ]; then

echo " "
echo -e "${blue}Installing GNOME Tweak Tool..." 
echo " "
sudo apt update
sudo apt install gnome-tweaks

echo " "
echo -e "${blue}Installing GNOME Extension Manager..." 
echo " "
sudo apt update
sudo apt install gnome-shell-extension-manager



else 
echo " "
echo -e "${cyan}Moving on..."

fi



echo " "
echo -e "${blue}Setting up snap..."
read -p $'\e[36mAre you running this on Linux Mint 20 or above? [y/n]\e[0m ' val
if [ "$val" = "y" ]; then
  echo " "
echo -e "${blue}Installing snap for linux mint..."
echo " "
sudo mv /etc/apt/preferences.d/nosnap.pref ~/Documents/nosnap.backup
sudo apt update -y
sudo apt install snapd
sudo systemctl start snapd
sudo systemctl enable snapd


else 
echo -e "${blue}Installing snap for other ubuntu based distros..."
sudo apt update
sudo apt install snapd
sudo systemctl start snapd
sudo systemctl enable snapd

fi

echo " "
echo -e "${purple}Setting up flatpak ..." 
echo " "
sudo apt update
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo " "
#echo -e "${green}Installing google chrome..." 
echo " "
#sudo apt update 
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo apt install ./google-chrome-stable_current_amd64.deb

echo " "
echo -e "${yellow}Installing timeshift..."
echo " "
sudo apt update
sudo apt install timeshift -y


echo " "
echo -e "${purple}Installing VLC Media Player..."
echo " "
sudo apt install vlc

echo " "
echo -e "${green}Installing gimp..."
echo " "
sudo apt install gimp

echo " "
echo -e "${yellow}Enabling ‘Minimize on Click’ for the Ubuntu Dock.."
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

echo " "
echo -e "${purple}Improving application startup speed"
echo " "
sudo apt-get install preload

echo " "
echo -e "${green}Installing synaptic package manager... "
echo " "
sudo apt install synaptic

echo " "
echo -e "${yellow}Installing htop..."
echo " "
sudo apt install htop

echo " "
echo -e "${purple}Installing microsoft fonts on ubuntu..."
echo " "
sudo apt update && sudo apt install ttf-mscorefonts-installer
sudo fc-cache -f -v

echo " "
echo -e "${green}Installing bleachbit..."
echo " "
sudo apt install bleachbit -y

echo " "
read -p $'\e[36mDo you want to install zoom? [y/n]\e[0m ' val
if [ "$val" = "y" ]; then
  echo " "
echo -e "${blue}Installing zoom..."
echo " "
sudo apt update -y
flatpak install flathub us.zoom.Zoom
else 
echo -e "${cyan}Moving on..."

fi

echo " "
read -p $'\e[36mDo you want to install whatsie (whatsapp-web client)? [y/n]\e[0m ' val
if [ "$val" = "y" ]; then
  echo " "
echo -e "${blue}Installing whatsie..."
echo " "
sudo apt update -y
flatpak install flathub com.ktechpit.whatsie
else 
echo -e "${cyan}Moving on..."

fi

echo " "
read -p $'\e[36meDo you want to install discord? [y/n]\e[0m ' val
if [ "$val" = "y" ]; then
  echo " "
echo -e "${blue}Installing discord..."
echo " "
sudo apt update -y
flatpak install flathub com.discordapp.Discord
else 
echo -e "${cyan}Moving on..."

fi

echo " "
read -p $'\e[36mDo you want to install telegram-desktop? [y/n]\e[0m ' val
if [ "$val" = "y" ]; then
  echo " "
echo -e "${blue}Installing telegram-desktop..."
echo " "
sudo apt update -y
flatpak install flathub org.telegram.desktop
else 
echo -e "${cyan}Moving on..."

fi

echo " "
read -p $'\e[36mDo you want to install spotify? [y/n]\e[0m ' val
if [ "$val" = "y" ]; then
  echo " "
echo -e "${blue}Installing spotify..."
echo " "
sudo apt update -y
flatpak install flathub com.spotify.Client
else 
echo -e "${cyan}Moving on..."

fi


echo " "
read -p $'\e[36mDo you want to install steam? [y/n]\e[0m ' val
if [ "$val" = "y" ]; then
  echo " "
echo -e "${blue}Installing steam..."
echo " "
sudo apt update -y
sudo apt install steam
else 
echo -e "${cyan}Moving on..."

fi

echo " "
read -p $'\e[36mDo you want to install OBS Studio? [y/n]\e[0m ' val
if [ "$val" = "y" ]; then
  echo " "
echo -e "${blue}Installing OBS Studio..."
echo " "
sudo apt update -y
sudo apt install obs-studio
else 
echo -e "${cyan}Moving on..."

fi


echo " "
read -p $'\e[36mDo you want to install bottles (Used to run windows apps on linux)? [y/n]\e[0m ' val
if [ "$val" = "y" ]; then
  echo " "
echo -e "${blue}Installing bottles..."
echo " "
sudo flatpak install flathub com.usebottles.bottles -y


else 
echo -e "${cyan}Moving on..."

fi



echo " "
read -p $'\e[36mDo you want to setup development environment (Git + VSCode + Github Desktop)? [y/n]\e[0m ' val
if [ "$val" = "y" ]; then
echo " "
echo -e "${blue}Installing git..."
echo " "
sudo apt update -y
sudo apt install git

echo " "
echo -e "${blue}Installing vscode..."
echo " "
sudo apt update -y
sudo apt install snapd
sudo snap install code --classic

echo " "
echo -e "${blue}Installing github-desktop..."
echo " "
sudo apt update -y
flatpak install -y flathub io.github.shiftey.Desktop

else 
echo -e "${cyan}Moving on..."
fi

echo " "
echo -e "${yellow}Cleaning up space..."
echo " "
echo -e "${purple}removing the packages that failed to install completely"
echo " "
sudo apt-get autoclean
echo " "
echo -e "${green}removing the apt-cache"

sudo apt-get clean
echo " "
echo -e "${yellow}removing the unwanted software dependencies"
echo " "
sudo apt-get autoremove

echo " "
echo -e "${purple}Displaying disk space usage of root partition (/) - "
df -h /
echo " "
echo -e "${green}Displaying disk space usage of home partition (/home) - "
df -h /home

echo " "
echo -e "${cyan}Some apps/changes will only appear after a restart, so don't worry if you can't see them on your system right now. Run 'sudo reboot' on terminal to restart your system."






















