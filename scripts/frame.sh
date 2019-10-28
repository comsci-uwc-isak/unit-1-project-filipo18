#!/bin/bash

#counting number of letters in a word
word=$*
len=${#word}



#calculating position of a word
x=1
((dev=$len/2))
((pos=49-$dev))

  #calibrating position depends on odd or even number of characters
  ((test=$len%2))
  echo $test
  if [[ ($test -eq 0) ]]; then
    x=0
  fi


#repeating sign % for 100 times
for (( i=0; i<100; i++ ))
do
  echo -n "%"
done
echo ""

#making one line of space and side signs
echo -n "%"
for (( i=0; i<98; i++ ))
do
  echo -n " "
done
echo "%"

#making another line of space and side signs
echo -n "%"
for (( i=0; i<98; i++ ))
do
  echo -n " "
done
echo "%"

      #positioning the word
      echo -n "%"
      for (( i=0; i<$pos; i++))
      do
        echo -n " "
      done
      #printing out the word
      echo -n $word
      #positioning the word
      for (( i=$x; i<$pos; i++))
      do
        echo -n " "
      done
      echo "%"


#making one line of space and side signs
echo -n "%"
for (( i=0; i<98; i++ ))
do
  echo -n " "
done
echo "%"


#making another line of space and side signs
echo -n "%"
for (( i=0; i<98; i++ ))
do
  echo -n " "
done
echo "%"

#making bottom line 
for (( i=0; i<100; i++ ))
do
  echo -n "%"
done
echo ""
