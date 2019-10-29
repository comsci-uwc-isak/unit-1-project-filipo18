#!/bin/bash

#This program will backup the entirity of the database folder within the MinimalCarRental application.

location=$1

#We check if user eneterd just one argument
if [[ $# -ne 1 ]]; then
	echo "Sorry, there was an error with backing up your files."
	exit
else
  #we copy database
	cp -a ~/Desktop/RentalCarApp/db $location
	echo "Successfully backed up into $location."
fi
