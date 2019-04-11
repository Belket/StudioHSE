#!/bin/bash

mkdir Studio
cd Studio
sudo apt update

#Git installing and clonning repo
sudo apt install git
git config —global user.name Arina-Konyakhina
git config —global user.email arina1304@mail.ru
git clone https://github.com/Arina-Konyakhina/Studio StudioClone
cd StudioClone
StudioCatalog=$(pwd)
echo $StudioCatalog

#Changing permissions
sudo chmod +x Install_Snowmix.sh
sudo chmod +x MIDIInput.sh
sudo chmod +x myscene
sudo chmod +x in_audio
sudo chmod +x out2
sudo chmod +x rtsp2feed_alpha
sudo chmod +x rtsp2feed_wo_alpha
sudo chmod +x killsnowmix.sh

#Download Snowmix and Gstreamer
sudo cp Install_Snowmix.sh /
cd /
./Install_Snowmix.sh

#Move to downloads directory
echo $StudioCatalog
cd $StudioCatalog

sudo apt-get install wmctrl

#Moving files to correct directories
sudo cp myscene /usr/local/bin/ #Main file that runs everything
sudo cp in_audio /usr/local/bin/ #Audio input stream
sudo cp out2 /usr/local/bin/ #An output file where all streams are mixed and written to the file
sudo cp rtsp2feed_alpha /usr/local/bin/ #Video input stream with chroma key
sudo cp rtsp2feed_wo_alpha /usr/local/bin/ #Video input stream without chroma key
sudo cp killsnowmix.sh /usr/local/bin/ #Kills all the streams at the end of recording
sudo cp myscene.ini /usr/local/lib/Snowmix-0.5.1/ini #Images and scenes parameters

sudo cp MIDIInput.sh /usr/local/bin/MIDIInput.sh

# Moving midi script to autostart
logout
cd ~/.config
mkdir autostart
cd $StudioCatalog
cp midi.desktop ~/.config/autostart/midi.desktop

# Removing trash
cd $StudioCatalog
cd ../..
sudo rm -R Studio
sudo apt-get remove git
cd /
sudo rm Install_Snowmix.sh

sudo reboot
