#!/bin/bash

#This program will check if program was installed corectlly

#Moving to installation location
cd /home/filip/Desktop
#Checking if main folder exists and seting first test variable to true
if [[ -d "RentalCarApp" ]]; then
  test1=true
fi


#Moving inside the folder
cd RentalCarApp
if [[ -d "db" && -d "scripts" ]]; then
  test2=true
fi

#checking if both test are positive
if [[ test1 && test2 ]]; then
  echo "Test complete, program was installed corectlly: passed "
else
  echo "Test failed, program installed incorrectly"
fi
