#!/bin/bash
while [ "$message" != 'bye' ]
do
  echo "Write your message (write bye to stop)"
  read message
  echo "Thanks for writing: $message"
done