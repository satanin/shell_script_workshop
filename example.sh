#!/bin/bash
if [ "$#" -gt 0 ]
then
  echo "Hello $1"
else
  echo "You need to pass me a parameter"
fi