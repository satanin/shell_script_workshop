#!/bin/bash
echo "This is going to
work"
if [ $1 -gt 0 ]
then # This is going to work
  echo "$1 is greater than 0"
else
  echo "$1 is less than 0"
fi