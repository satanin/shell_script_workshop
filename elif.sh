#!/bin/bash
if [ "$1" = "Alex" ]
then
  echo "Hello $1"
elif [ $# -gt 0 ]
then
  echo "$1 you suck"
else
  echo "You need to pass me a parameter"
fi