#!/bin/bash
echo "What's your name?"
read name
case $name in
  [aA]lex|Peter)
    echo "Hi $name"
    ;;
  Joe)
    echo "You suck $name"
    ;;
  *)
    echo "You're awesome $name"
    ;;
esac