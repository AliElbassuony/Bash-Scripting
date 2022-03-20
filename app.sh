#!/bin/bash
read x y

if [ $x -lt $y ]; then
   echo "x less than y"
elif [ $x -eq $y ]; then
   echo "Equal"
else
   echo "x greater than y"
fi
