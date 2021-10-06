#!/bin/bash
echo "'Hello World' length is 0?"
[ -z "Hello World" ] && echo "true" || echo "false"
echo "'Hello World' length is greater than 0?"
[ -n "Hello World" ] && echo "true" || echo "false"
echo "'Hello World' length is greater than 0?"
[ "Hello World" ] && echo "true" || echo "false"
echo "'Hello World' is equal to 'Hello World'?"
[ "Hello World" = "Hello World" ] && echo "true" || echo "false"
echo "'Hello World' is equal to 'hello world'?"
[ "Hello World" = "hello world" ] && echo "true" || echo "false"
echo "'Hello World' is not equal to 'Hello World'?"
[ "Hello World" != "Hello World" ] && echo "true" || echo "false"
echo "1 is less than 0?"
[ 1 -lt 0 ] && echo "true" || echo "false"
echo "1 is less or equal than 0?"
[ 1 -le 0 ] && echo "true" || echo "false"
echo "1 is greater than 0?"
[ 1 -gt 0 ] && echo "true" || echo "false"
echo "1 is greater or equal than 0?"
[ 1 -ge 0 ] && echo "true" || echo "false"
echo "1 is equal 0?"
[ 1 -eq 0 ] && echo "true" || echo "false"
echo "1 is not equal 0?"
[ 1 -ne 0 ] && echo "true" || echo "false"
echo "example.sh file exists"
[ -e example.sh ] && echo "true" || echo "false"
echo "example.sh file exists and is a regular file"
[ -f example.sh ] && echo "true" || echo "false"
echo "example.sh file exists and is a directory"
[ -d example.sh ] && echo "true" || echo "false"
echo "example.sh file exists with read permissions"
[ -r example.sh ] && echo "true" || echo "false"
echo "example.sh file exists with write permissions"
[ -w example.sh ] && echo "true" || echo "false"
echo "example.sh file exists with execute permissions"
[ -x example.sh ] && echo "true" || echo "false"
echo "example.sh file exists and size is greater than 0 bytes"
[ -s example.sh ] && echo "true" || echo "false"
echo "example.sh file exists and owner is effective user id"
[ -O example.sh ] && echo "true" || echo "false"
echo "example.sh file exists and owner is effective group id"
[ -G example.sh ] && echo "true" || echo "false"
echo "example.sh file exists and is a symbolic link"
[ -h example.sh ] && echo "true" || echo "false"
echo "example.sh file exists and is a symbolic link"
[ -L example.sh ] && echo "true" || echo "false"
echo "example.sh file exists and is a block-special file"
[ -b example.sh ] && echo "true" || echo "false"
echo "example.sh file exists and is a caracter-special file"
[ -c example.sh ] && echo "true" || echo "false"
echo "example.sh file exists and is a Socket"
[ -S example.sh ] && echo "true" || echo "false"