#!/bin/bash

function check_root() {
    # Checking for root access and proceed if it is present
    ROOT_UID=0
    if [[ ! "${UID}" -eq "${ROOT_UID}" ]]; then
        # Error message
        echo_error 'Run me as root.'
        echo_info 'try sudo ./updateUbuntu.sh'
        exit 1
    fi
}


echo "This will update Ubuntu/Ubuntu based distros and install recommended software!"

echo " "
echo "Updating System..." 
echo " "
sudo apt update -y && sudo apt upgrade -y

echo " "
echo "Installing neofetch..." 
echo " "
sudo apt install neofetch

echo " "
echo "Enabling Firewall..."
echo " "
sudo apt update
sudo ufw enable


echo " "
echo "Improving battery life..." 
echo " "
sudo apt-get install tlp tlp-rdw
sudo systemct1 enable tlp
sudo tlp start

echo " "
echo "Installing Multimedia Codecs..." 
echo " "
sudo add-apt-repository multiverse
sudo apt update -y
sudo apt install ubuntu-restricted-extras

echo " "
echo "Installing GNOME Tweak Tool..." 
echo " "
sudo apt install gnome-tweaks

echo " "
echo "Installing GNOME Extension Manager..." 
echo " "
sudo apt install gnome-shell-extension-manager

echo " "
echo "Setting up snap..."
read -p "Are you running this on Linux Mint 20 or above? [y/n] " val
if [ "$val" = "y" ]; then
  echo " "
echo "Installing snap for linux mint..."
echo " "
sudo mv /etc/apt/preferences.d/nosnap.pref ~/Documents/nosnap.backup
sudo apt update -y
sudo apt install snapd
sudo systemctl start snapd
sudo systemctl enable snapd


else 
echo "Installing snap for other ubuntu based distros..."
sudo apt update
sudo apt install snapd

fi

echo " "
echo "Setting up Flatpak ..." 
echo " "
sudo apt update
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo " "
echo "Installing Google Chrome..." 
echo " "
sudo apt update 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

echo " "
echo "Installing Timeshift..."
echo " "
sudo apt update
sudo apt install timeshift -y


echo " "
echo "Installing VLC Media Player..."
echo " "
sudo apt install vlc

echo " "
echo "Installing Gimp..."
echo " "
sudo apt install gimp

echo " "
echo "Enabling ‘Minimize on Click’ for the Ubuntu Dock.."
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

echo " "
echo "Improving Application Startup Speed"
echo " "
sudo apt-get install preload

echo " "
echo "Installing Synaptic Package Manager... "
echo " "
sudo apt install synaptic

echo " "
echo "Installing htop..."
echo " "
sudo apt install htop

echo " "
echo "Installing Microsoft fonts on Ubuntu..."
echo " "
sudo apt update && sudo apt install ttf-mscorefonts-installer
sudo fc-cache -f -v

echo " "
echo "Installing Bleachbit..."
echo " "
sudo apt install bleachbit -y

echo " "
read -p "Do you want to install Whatsie (WhatsApp-Web Client)? [y/n] " val
if [ "$val" = "y" ]; then
  echo " "
echo "Installing Whatsie..."
echo " "
sudo apt update -y
flatpak install flathub com.ktechpit.whatsie
else 
echo "Moving on..."

fi

echo " "
read -p "Do you want to install Discord? [y/n] " val
if [ "$val" = "y" ]; then
  echo " "
echo "Installing Discord..."
echo " "
sudo apt update -y
flatpak install flathub com.discordapp.Discord
else 
echo "Moving on..."

fi

echo " "
read -p "Do you want to install Telegram-Desktop? [y/n] " val
if [ "$val" = "y" ]; then
  echo " "
echo "Installing Telegram-Desktop..."
echo " "
sudo apt update -y
flatpak install flathub org.telegram.desktop
else 
echo "Moving on..."

fi

echo " "
read -p "Do you want to install Spotify? [y/n] " val
if [ "$val" = "y" ]; then
  echo " "
echo "Installing Spotify..."
echo " "
sudo apt update -y
flatpak install flathub com.spotify.Client
else 
echo "Moving on..."

fi


echo " "
read -p "Do you want to install Steam? [y/n] " val
if [ "$val" = "y" ]; then
  echo " "
echo "Installing Steam..."
echo " "
sudo apt update -y
sudo apt install steam
else 
echo "Moving on..."

fi

echo " "
read -p "Do you want to install OBS Studio? [y/n] " val
if [ "$val" = "y" ]; then
  echo " "
echo "Installing OBS Studio..."
echo " "
sudo apt update -y
sudo apt install obs-studio
else 
echo "Moving on..."

fi


echo " "
read -p "Do you want to install Bottles (Used to run windows apps on linux)? [y/n] " val
if [ "$val" = "y" ]; then
  echo " "
echo "Installing bottles..."
echo " "
sudo flatpak install flathub com.usebottles.bottles -y


else 
echo "Moving on..."

fi



echo " "
read -p "Do you want to setup development environment (Git+ VSCode + Github Desktop)? [y/n] " val
if [ "$val" = "y" ]; then
echo " "
echo "Installing git..."
echo " "
sudo apt update -y
sudo apt install git

echo " "
echo "Installing VSCode..."
echo " "
sudo apt update -y
sudo apt install snapd
sudo snap install code --classic

echo " "
echo "Installing Github Desktop..."
echo " "
sudo apt update -y
flatpak install -y flathub io.github.shiftey.Desktop

else 
echo "Moving on..."
fi

echo " "
echo "Cleaning up space..."
echo " "
echo "removing the packages that failed to install completely"
echo " "
sudo apt-get autoclean
echo " "
echo "removing the apt-cache"
echo " "
sudo apt-get clean
echo " "
echo "removing the unwanted software dependencies"
echo " "
sudo apt-get autoremove

echo " "
echo "Some apps/changes will only appear after a restart, so don't worry if you can't see them on your system right now. Run 'sudo reboot' on terminal to restart your system."









