#!/bin/bash

#This file test the firt successcriterio, namely.
#A car can be created and sotred in the database

#Step 1: creaste a car usig the script created
cd ../
bash create.sh TXM301 nissan red 9

#Step 2: check if the license file .txt was created
if [[ -f "db/TXM301.txt" ]]; then
  echo "Test one: a txt file was created inside the database: passed"
else
  echo "Test one: Error. File not found: not passed"
fi

#step 3: Check that the car was added to main File
cat db/maincarfile.txt
lastline=$( tail -n 1 db/maincarfile.txt )

#Tail read file from the bottom, now I just check if lastline matches our entry
if [[ "TXM301 nissan red 9" == $lastline ]];then
  echo "Test two: Recored was entered correctly: passed"
else
  echo "Test two: Failed"
fi
