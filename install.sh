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
    cd $path
    echo "moving to $path"

else
  #moving to default location
  cd /home/filip/Desktop
fi

#Create App folder
mkdir RentalCarApp

#move to created folder
cd RentalCarApp

#create for database and scripts
mkdir database
mkdir scripts

echo "structure created successfully"
