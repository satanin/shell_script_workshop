#!/bin/bash
file=$(ls -lah | grep example | awk '{ print $9 }')
echo "The example's file name is: $file"