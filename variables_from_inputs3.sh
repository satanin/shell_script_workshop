#!/bin/bash
# echo "Tell me more than one thing, separated by spaces or tabs"
# read thing1 thing2 thing3
# echo "Thing 1: $thing1"
# echo "Thing 2: $thing2"
# echo "Thing 3: $thing3"


old_IFS="$IFS"
IFS=,
echo "Tell me more than one thing, separated by comma"
read thing1 thing2 thing3
IFS=$old_IFS
echo "Thing 1: $thing1"
echo "Thing 2: $thing2"
echo "Thing 3: $thing3"
