#!/bin/bash

#This program tests if delete program works propperly

#Runing create script
cd ../
bash create.sh AXT567 AUDI red 5

#Running delete program
bash delete.sh AXT567

#moving to db folder
cd  db

#checking if file is deleted
if [[ -f "AXT567" ]]; then
  echo "Test failed"
else
  echo "Test complete, car was deleted correctly: passed"
fi
