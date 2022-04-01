#!/usr/bin/bash

#Using for

#for i in $* 
#do
#	echo $*
#	shift
#done

# using while

while [ $# -gt 0 ]; do
	echo $*
	shift
done

