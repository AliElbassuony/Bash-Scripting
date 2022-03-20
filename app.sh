#!/bin/bash
read x y
read -t 3 z

n="than"
q="equal"

echo $x + $y = $(($x + $y))

if [ $x -lt $y ]; then
   printf ""
elif [ $x -eq $y ]; then
   echo $q
elif [ -z $z ]; then
	echo "Not Exist"
else
   printf "%d greater $s $d" $x $n $y
fi
