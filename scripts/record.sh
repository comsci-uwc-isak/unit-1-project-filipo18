#!/bin/bash

#This program will recor car trip and
#write data into plate.txt file

#changing arguments into variables
plate=$1
km=$2
dateout=$3
datein=$4


#moving to instalation folder
cd ~/Desktop/RentalCarApp/db/

#checking if file plate.txt exist, and if user eneterd
#4 arguments
if [[ ($# -ne 4) ]]; then
  echo "Incorrect input. Please enter Plate, kilometers, dateout, datein Exiting the program... "


elif [ ! -f "$1.txt" ]; then
  echo "Car don't exist, please crate a car, exiting the program... "

#creating plate.txt file with data about each specific car
else
  echo "$km $dateout $datein" >> $plate.txt
  echo "Trip recorded, exiting the program"

fi
