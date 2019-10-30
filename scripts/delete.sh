#!/bin/bash


#This prgoram will delete car entery by users choice

#moving to db directroy
cd ..
cd db

#Checking if user entered argument, if not giving him options
if [[ $* == "" ]]; then
  echo "Incorrect choice, please choose car from the list bellow: "
    ls

#deleting file if user entered correct argument
elif [[ -f "$*.txt" ]]; then
  rm $*.txt
  #delete whole line which includes the plate
  sed -i "/$1/d" maincarfile.txt
  cd ..
  cd scripts
  bash frame.sh "The car information was successfully deleted"
  echo "Car deleted succesfully!"
  exit
#Checking if user entered correct argument, if not giving him options
else
  echo "Incorrect choice, please choose car from the list bellow: "
  ls
fi


#getting users delete choice
echo "Choose which car you want to delete IMPORTANT - LEAVE OUT .txt ENDING OF A FILE"
read car
#checking if choice is correct, and deleting chosen car
if [[ -f "$car.txt" ]]; then
  rm $car.txt
  echo "Car deleted succesfully"
  #delete whole line which includes the plate
  sed -i "/$1/d" maincarfile.txt
  cd ..
  cd scripts
  bash frame.sh "The car information was successfully deleted"
  exit

#if user did mistake entering the car name, exiting the program
else
  echo "Incorrect choice, exiting the program!"
  exit
fi