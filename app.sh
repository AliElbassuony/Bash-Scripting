#!/bin/bash

name=$1
echo "Welocome $name"
read x y

<< comment
This is multiline commnet
----read arguments----
-t => time to leave
-s => secret password
-p => message with input
comment


read -t 3 z

n=than
q=equal
un=unseted
readonly $n

echo before $un
unset un

# To eval numerical values we use $(()) and put operation between them
echo $x + $y = $(($x + $y))
# Another way
echo `expr $x + $y`

if [ $x -lt $y ]; then
   printf "%d less %s %d" $x $n $y
elif [ $x -eq $y ]; then
   echo $q
elif [ -z $z ]; then
	echo "z Not Exist"
else
   printf "%d greater $s $d" $x $n $y
fi

echo $un

# Array Section

arr=("Ali" "Mo" "Ahmed")
echo ${arr[*]}
echo ${arr[0]}

i=0
while [ $i -lt 10 ]; do
      echo $i
      i=`expr $i + 1`
done

j=1
until [ ! $j -le 10 ]; do
      echo $j
      j=`expr $j + 1`
done

