#!/bin/bash


#This file uninstalls RentalCarApp
#By deleting all folders

#checking if user didn't click run uninstall program by accident"
echo "Are you sure you want to uninstall RentalCarApp?"
echo "( Press enter to continue press x to cancel )"

#reading users decision
read cancel

if [[ ($cancel == x) ]];then
  echo "canceling..."
  sleep 2
  exit

else
  cd /home/filip/Desktop
  rm -r RentalCarApp
  echo "RentalCarApp succesfully uninstalled"
fi
