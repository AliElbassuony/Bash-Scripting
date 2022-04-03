#!/bin/bash

echo =========================================== Demo ====================================
echo =========================================== Day 1 ===================================

name=$1
echo "Welocome $name"

for i in {1..10}; do
	echo $i
done
read x y
<<comment
This is multiline commnet
----read arguments----
-t => time to leave
-s => secret password
-p => message with input
comment

read -t 2 z

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

#grep -wi word


echo ====================== day 2 =======================
<< day2

useradd ali ; echo $?

grep -w  name |

#id username 
check=$(id ali)

echo $check

check=$(id user 2> /dev/null)

check=$(id $1 2> /dev/null)

if [ -z $check ]
B
then
	echo user doesnot exist
else
	echo exist
fi
======================================
cut ==> for columns
=============================
cut -d: -f1-3,5 /etc/passwd
cut -d" " => space 
=======================================
grep ==> for rows
==========
to general word
grep user /etc/passwd
========================
grep -w
========================
to exact word
grep -w user /etc/passwd

=========================
grep -i
========================

case insensitive
grep -i user /etc/passwd

grep -iw user /etc/passwd
=========================
grep -A
-========================
2 rows After search name
grep -A2 user /etc/passwd

U can use by head or tail
grep -A2 user /etc/passwd | tail -1
grep -A2 user /etc/passwd | tail -2 | head -1
=========================
grep -B
==========================
2 rows Before your search
grep -B2 user /etc/passwd
=========================
grep -r
=======================
B
search file recursivly
grep -r user /home/Ali
========================
grep -v 
=======================
invert search => return all ecxept search word
grep -v user /etc/passwd
========================
useradd -md => to choose home dir for user
useradd -md /home/cyber user19

========================================
grep ^user /etc/passwd => start with user

grep user$ /etc/passwd => end with user
========================================
to store ip in variable

=========================
ip=`ifconfig | grep inet | head -1 | cut -d " " -f10`
A
echo $ip
====================================================
$ you can run your script using ./useradd inputfile 	outputfile
inputfile=$1
outfile-=$2


while read myline 
do
	username=$(echo $myline | cut -d , -f1 )
	email=$(echo $myline | cut -d , -f2)
	mobile=$(echo $myline | cut -d , -f3)
	
	useradd $username

	pass=$(openssl rand -base64 8 )
	echo $pass | passwd --stdin $username
	echo $username:$pass:$email:$mobile >> $outfile

done < $inputfile 


cut -d , -f1 Book1.csv

# try to make script send mails by mailx or sentmail in centos


select i in install update delete
do
	case $i in
	 install) echo install ;;
	 update) echo update ;;
	 delete) echo delete ;;
	 *) echo $ $REPLY ;;
       esac
done

===============================================================================
sed => stream editor - like => nano - vim | none interactive | none destructive
================================================================================
sed 'command' filename
command => 1- address 2-action

address => 1- lines number 2-regex
action => 1- substitute 2-delete 3-print
===============================================
first occurence in same line
sed 's/unix/linux' file
     search/sub

 using double " when using vars

 all occurences
 


 sed 's/u/c/g' file

 sed 's/u/c/2' file

 sed 's/u/c/2g' file
if mutiple coomand


file

sed -f fileaction file



=======================
address

sed '3,4 s/u/c/g' file

sed '2,$ s/u/c/g' file


sed -n 's/unix/linux/gp' file

sed '1,2 d' file

sed '/unix/ d' file

sed 's/c/a/g' file > out

sed -i 's/c/a/g' file => edit in same file

day2

echo ================== day 3 =============================
<< day3

dos2unix file


day3


awk "BEGIN { i=0 } { i++ } END { print i }" file 

