#!/bin/bash
#This program edit the information of an exiting car in the
#maincarfile
#user enters [license place] [model] [color] [pp]

#checking if user eneterd correct number of arguments
if [ $# -ne 4 ]; then
  echo "Error with the number of arguments"
  echo "Enter License Model Color Passengers"
  cd ..
  cd db
  ls
  exit
fi

#Making arguments variables
license=$1
maker=$2
model=$3
pp=$4

#Changing to right directory
cd ../db

#Checking if wanted car exists
if [ ! -f "$license.txt" ]; then
  echo "File not found!"
  cd ..
  cd db
  ls
fi

#find the line with the given car plate and delete it
sed -i "/^$license/d" maincarfile.txt
#add the new information
echo "$license $maker $model $pp" >> maincarfile.txt
cd ../scripts
bash frame.sh "Car edited successfully"
