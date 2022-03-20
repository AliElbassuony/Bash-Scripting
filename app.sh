#!/bin/bash

read x y

<< comment
This is multiline commnet
----read arguments----
-t => time to leave
-s => secret password
-p => message with input
comment


read -t 3 z

n="than"
q="equal"

# To eval numerical values we use $(()) and put operation between them
echo $x + $y = $(($x + $y))

if [ $x -lt $y ]; then
   printf ""
elif [ $x -eq $y ]; then
   echo $q
elif [ -z $z ]; then
	echo "z Not Exist"
else
   printf "%d greater $s $d" $x $n $y
fi
