#!/bin/bash

#This file creates the folder structure for the
#minimal Car Rental App

echo "Starting the installation"
echo "Default install path is /home/filip/Desktop"
echo "Press Enter to continue installation, if you"
echo "want to change install path press x  "

read choice

#checking what user eneted
if [[ ($choice == x) ]];then
    echo "Enter installation path, then press Enter"
    read path

    #movih to the desired location
    echo "Starring the installation"
    cd ~/$path
    #Create App folder
    echo "Creating folders"
    mkdir CarRentalApp
    cd CarRentalApp
    mkdir db
    mkdir scripts
    mkdir tests



    cp -a ~/Downloads/CarRentalAppInstall/scripts/. ~/$path/CarRentalApp/scripts
    cd scripts
    bash frame.sh "Install successfully"

else
  #moving to default location

    echo "Starring the installation"
    cd ~/Desktop
    #Create App folder
    echo "Creating folders"
    mkdir CarRentalApp
    cd CarRentalApp
    mkdir db
    mkdir scripts
    mkdir tests


    echo "Set up scripts file"
    cp -a ~/Downloads/CarRentalAppInstall/scripts/. ~/Desktop/CarRentalApp/scripts
    cd scripts
    bash frame.sh "Install successfully"
fi
