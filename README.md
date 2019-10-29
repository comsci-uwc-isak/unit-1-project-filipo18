![CarRental](logo.png)

Car Rental Minimal App
===========================

A car rental management minimal app in Bash.

Contents
-----
  1. [Planning](#planning)
  1. [Design](#design)
  1. [Development](#development)
  1. [Evalution](#evaluation)

Planning
----------
### Defining the problem (Topic 1.1.1)
We need to create simple program, based in terminal.
Installation must be easy. User wants that easy commands
allow him to create car, record a trip, querythe trip
history of a car, edit and delete car. It is specificly 
requested that commands for entering the trip distance are 
easy. We need to add bascis permenet storage system and backup,
comamand to see total statistics is neccesery.

### Solution proposoed
Because user wants simple program based in terminal, I will be using bash. 



### Sucess Criteria
This are mesurable outcomes
1. A car can be created and stored in database
1. A car infromation can be edited
1. A car can be deleted from the database
1. The installation is simple-> one step process
1. A summary (total/avrage distance traveled) can be generated for particular car
1. Trips can be recorded and stored for an existing car
1. A basic database system is implemented
1. A baasic backup funcionality is avelible

Design
---------
### First sketch of the system
![SystemDiagram](Systemdiagram.png)
**Fig. 1** This is first shetch of the system showing main input/output coponets, actions, and software requirements.


Development
--------
**Install program**
```sh
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
``` 
This file works

**Uninstall program**
```sh
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
```
This file works

**Create a new car - file**
1. Get inputs
2. Check number of arguments if 4 then continue, if not exit "message"
3. Write to main file with one extra line. NOt erasing other entries
4. Create car trip file with license plate.txt

```sh
#!/bin/bash

#This program creates new car based on arguments entered by user
#it will crate maincar file and record file for the car



#checking if user enetered 4 arguments, ad exiting the program if not
if [[ ($# -ne 4) ]]; then
  echo "Incorrect input. Please enter Plate, Model, Color, Passengers. Exiting the program... "
  exit
fi


#All data is entered, program will continue
plate=$1
model=$2
color=$3
pp=$4

#adding new entry to file maincarfile.txt
echo "$plate $model $color $pp" >> ~/Desktop/RentalCarApp/db/maincarfile.txt
echo "" > ~/Desktop/RentalCarApp/db/$plate.txt
bash frame.sh "Car created successfully"
```

**Create record file for a car**
```sh
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
```

**Delete a car program**
```sh
#!/bin/bash


#This prgoram will delete car entery by users choice

#moving to db directroy
cd db

#Checking if user entered argument, if not giving him options
if [[ $* == "" ]]; then
  echo "Incorrect choice, please choose car from the list bellow: "
  ls
#deleting file if user entered correct argument
elif [[ -f "$*.txt" ]]; then
  rm $*.txt
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
  exit
#if user did mistake entering the car name, exiting the program
else
  echo "Incorrect choice, exiting the program!"
  exit
fi
```

**Create summary program**
```sh
#!/bin/bash

#This pogram will add kilometers in one car.txt file

#moving to right location
cd ..
cd db

#checking if user enetred right arguments
if [ $# -ne 1 ]; then
echo "Enter license plate"
ls
exit
fi

file=$1

#Printing total ditance for all cars if user enters all as an argument
if [ $* == all ]; then
    #Calculating total distance
    total=0
    #comand read used with while loop will read the file
    # chosen od the end of loop done < "file.txt" line by line
    while read line;
    do
      #for loop will go throug line word by word
      for km in $line
      do
        (( total=$km+$total ))
        #break will break the loop after first cycle
        break
      done
    done < "trip.txt"

    #Printing out the results with frame
    cd ..
    cd scripts
    bash frame.sh "TOTAL DISTANCE TRAVELED BY ALL CARS WAS: $total"
    exit

elif [ ! -f "$file.txt" ]; then
  echo "File for car $file does not exist."
  exit
fi



#Calculating total distance for one car
total=0
#comand read used with while loop will read the file
# chosen od the end of loop done < "file.txt" line by line
while read line;
do
  echo $line
  #for loop will go throug line word by word
  for km in $line
  do
    (( total=$km+$total ))
    #break will break the loop after first cycle
    break
  done
done < "$file.txt"

#Printing out the results with frame
cd ..
cd scripts
bash frame.sh "TOTAL DISTANCE TRAVELED FOR $file was: $total"
```

Evaluation
-----------
**Create Test 1** 
First run of the program we had one issue: the test file neededto move to move to the main folder
```-sh
cd ../
```
This is necessary because the 'create.sh' resides in the main folder where as the test file is inside the /tests folder


To check that car wac created in main file (maincarfile.txt), the following command is used ```.sh lastline = $( tail -n 1 db/maincarfile.txt ) ``` . Tail reads file from the bottom, n is number of the  line

**Create Test 2** 
Everything works correctly. This is test program.
```.sh
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
```
**Summary:** We did dynamic alpha white box testing. Dynamic means that we actually run the code, alpha means that it was runned by developers. White box testing means that we have acces to internals of the program.

**Install Test 1**
Test works, but I encountered few problems:
1. Testing is not dynamic, I am not really running the install program, just checking result after program was runed manually. If I run install program again for testing, old installation gets overwritten
1. works just for default installation path
1. There is still problem with delte program, it deletes just record files and not enteries in maincarfile
1. When I fix problem with delete file, then there is problem with test file, how to test if car was deleted in main car file



```sh
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
```

**Delete test 1**
Test program works but there are still some major problems
1. There is still problem with delte program, it deletes just record files and not enteries in maincarfile
1. When I fix problem with delete file, then there is problem with test file, how to test if car was deleted in main car file

```sh
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
```

