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
if [ $file == all ]; then
    #Calculating total distance
    total=0
    #comand read used with while loop will read the file
    # chosen od the end of loop done < "file.txt" line by line

    #this will loop throug all the txt files in folder
    for f in *.txt;
    do
        #This if sentance will avoid maincarfile.txt
        if  [[ ($f == "maincarfile.txt") ]];then
            continue

        fi

        while read line;
        do
          #for loop will go throug line word by word
          for km in $line
          do
            (( total=$km+$total ))
            #break will break the loop after first cycle
            break
          done
        done < "$f"
    done

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



