%title: Shell Scripting Workshop
%date: 06-10-2021
%author: Raul
Shell scripting
=========

<br>
* Please be aware that Im not an expert
<br>
* But I will do my best!.👍🏻

---
Scripting Guidelines
===

The basics
---
* Every script should being with *“#!/bin/a_shell”*
* Every new line is a new command
* Comment lines start with a #
  - Except the first one with the \!


---
"#!/bin/bash or #!/bin/sh or #!/bin/dash" or ...
====

The \! after the # tells the parser that this is not
a comment this `!#` it's called she-bang,short name
for #(sharp) \!(bang). The following path indicates
which shell is going to be used to execute the script.
_*this should be in the first line of the script*_
ideally the first two bytes [or it can be problematic](https://github.com/koalaman/shellcheck/wiki/SC1128),
after the first line the \!# becomes a regular comment
and the script output may not be the rone you're expecting.

The reason that so many scripts begin with
`/bin/bash` or `/bin/sh` is because this are the
most common paths and shells.

Example:
```
  #!/bin/bash
  echo "Hello World"
```

---
Every new line is a command
===

Every new line should be considered as a new command
or a component of a multiple line commands like
`if/then/else`. Note that `echo` command interprets
all inside `""` as a single parameter even new lines,
so it does not fail.

```
  #!/bin/bash
  echo "This is going to
  work"
  if [ $1
  -gt 0 ] # This is going to fail here!
  ...
```
input:`$ ./every_new_line_is_a_command.sh 1`
output:
```
This is going to
work
./every_new_line_is_a_command.sh: line 4: [: missing `]'
./every_new_line_is_a_command.sh: line 5: -gt: command
not found 1 is less than 0
```

```
  #!/bin/bash
  echo "This is going to
  work"
  if [ $1 -gt 0 ];then # This is going to work
      echo "$1 is greater than 0"
  else
    echo "$1 is less than 0"
  fi
```

input: `$ ./every_new_line_is_a_command.sh 1`

output:
```
This is going to
work
1 is greater than 0
```

---
Comments start with a \#
===

Except in the first line, every other line with a \# is
going to be considered a comment.

```
  #!/bin/bash
  #! This is considered also a comment
  echo "Hello World" # This is another comment
```

input: `$ ./comments.sh`

output: `Hello World`

---
Variables
===

Like any other language shell scripting has variables you
should declare variables using *`name=value`* note that if
you use `name = value` is going to interpret `name` as a
program and `=` and `value` as arguments.

```
  #!/bin/bash
  NAME=Alex
  echo "$NAME"
```

input: `$ ./variables.sh`

output: `Alex`

```
  #!/bin/bash
  NAME = Alex
  echo "$NAME"
```

input: `$ variables.sh`

output:
`line 2: NAME: command not found`

---
Variable values as command outputs
===

Sometimes we need a variable value that is going to be
the output of another command, we can do this using the
following syntax `variable=$(command -options)`.

```
  #!/bin/bash
  file=$(ls -lah | grep example | awk '{ print $9 }')
  echo "The example's file name is: $file"
```
input: `$ ./variable_value_as_command_output.sh`

output:
`The example's file name is: example.sh`

---
Parameters
===

We can asing parameters to variables using the following
syntax `variable_name=$#` being the `#` the order of the
parameter passed.

```
  #!/bin/bash
  name=$1
  other_name=$2
  echo "The name is: $name"
  echo "The other name is: $other_name"
```

input: `$ ./parameters.sh Alex Joe`

output:
`The name is: Alex`
`The other name is: Joe`

---
Environment Variables
===

We can access environment variables in our scripts

```
  #!/bin/bash
  echo "The name is: $NAME"
  echo "The other name is: $ANOTHER_NAME"
```

input: `$ NAME=Alex ANOTHER_NAME=Joe ./environment_variables.sh`

output:
`The name is: Alex`
`The other name is: Joe`

---
Variables from inputs
===
We can read user inputs and assing the value to
a variable using: `read variable_name`.

```
  #!/bin/bash
  echo "What's your name?"
  read NAME
  echo "Your name is $NAME"
```

input: `$ ./variables_from_inputs.sh`

output:
```
What's your name?
Pepe
Your name is Pepe
```

We can assign default values to variables not passed

```
  #!/bin/bash
  name=${1:-'Alex'}
  echo "Hi $name"
```

input: `$ ./variables_from_inputs2.sh`

output: `Hi Alex`

input: `$ ./variables_from_inputs2.sh Joe`

output: `Hi Joe`

---
Variables from inputs 2
===

Read command can take several inputs separated by spaces or tab.

```
  #!/bin/bash
  echo "Tell me more than one thing, separated by spaces or tabs"
  read thing1 thing2 thing3
  echo "Thing 1: $thing1"
  echo "Thing 2: $thing2"
  echo "Thing 3: $thing3"
```

The IFS or *Internal Field Separator* can be modified within the
script.

```
  #!/bin/bash
  old_IFS="$IFS"
  IFS=,
  echo "Tell me more than one thing, separated by comma"
  read thing1 thing2 thing3
  IFS=$old_IFS
  echo "Thing 1: $thing1"
  echo "Thing 2: $thing2"
  echo "Thing 3: $thing3"
```

---
Test Command 1/3
===

We have a special command called *test* to help us evaluate
conditions. The alias for this command is `[`. *Test* command
is used in almost all the shells and his syntax can be little
bit tricky.

This works: `[ 1 -gt 0 ] && echo "Wow"`
output: `Wow`

This does not work: `[1 -gt 0] && echo "Wow"`
output: `bash: [1: command not found`

This is because is trying to execute the command `[1` that
doesn't exists in our shell.

We can do the same using the whole name:

input: `$ test 1 -gt 0 && echo "Wow"`
output: `Wow`

---
Test Command 2/3
===

Common expresions used in test command:
* `[ -z <string> ]` The string length is zero.
* `[ -n <string> ]` The string length is not zero.
* `[ <string> ]` equivalent to -n.
* `[ <string> = <string>]` strings are equal.
* `[ <string> != <string>]` strings are equal.
* `[ <integer> -lt <integer> ]` Integer is less
than another integer.
* `[ <integer> -le <integer> ]` Integer is less or
equal another integer.
* `[ <integer> -gt <integer> ]` Integer is greater
than another integer.
* `[ <integer> -ge <integer> ]` Integer is greater
or equal another integer.
* `[ <integer> -eq <integer> ]` Integer is equal
another integer.
* `[ <integer> -ne <integer> ]` Integer is not equal
another integer.

---
Test Command 3/3
===

We can also use files in test command.
* `[ -e <file> ]` File exists
* `[ -f <file> ]` File exists and is a regular file
* `[ -d <file> ]` File exists and is a directory
* `[ -r <file> ]` File exists with read permissions
* `[ -w <file> ]` File exists with write permissions
* `[ -x <file> ]` File exists with execute permissions
* `[ -s <file> ]` File exists with size greater than 0 bytes
* `[ -O <file> ]` File exists and the owner is efective user ID.
* `[ -G <file> ]` File exists and the owner is efective group ID.
* `[ -h <file> ]` File exists and is a symbolic link.
* `[ -L <file> ]` File exists and is a symbolic link.
* `[ -b <file> ]` File exists and is a block-special file.
* `[ -c <file> ]` File exists and is a caracter-special file.
* `[ -S <file> ]` File exists and is a Socket.

---
if
===

Conditionals usually use test command to evaluate
conditions, so following with the previous example
we can use an `if` conditional as follows:

```
  #!/bin/bash
  if [ $# -gt 0 ]
  then
    echo "Hello $1"
  else
    echo "You need to pass me a parameter"
  fi
```

Note that `$#` tells us the number of params passed to the
script.

input: `./conditionals.sh`

output: `You need to pass me a parameter`

input: `./conditionals.sh Joe`

output: `Hello Joe`

Also note that we can use semicolo as line breaks:
`if [ $# -gt 0 ];then "Hello $1";else ... fi`

is equivalent to the other way but much less readable.

---
elif
===

We can use elif to check a second condition.

```
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
```

input: `$ ./elif.sh Alex`

output: `Hello Alex`

input: `$ ./elif.sh Joe`

output: `Joe you suck`

input: `$ ./elif.sh`

output: `You need to pass me a parameter`

---
for loop
===

We use for loops to iterate through a set of values until
the list is exausted. The for loop syntax admits multiple
parameters.

```
  #!/bin/bash
  for value in 1 2 3 4 5
  do
    echo "$value time iterating"
  done
```

easy right? guess the output of this one

```
  #!/bin/bash
  for value in hello 1 * 2
  do
    echo "$value"
  done
```

Note that  \* is a wildcard.

---
while loop
===

*While* loops run until meeting a condition, yes we are
going to use `test` again for the condition.

```
  #!/bin/bash
  while [ $message != 'bye' ]
  do
    echo "Write your message (write bye to stop)"
    read message
    echo "Thanks for writing: $message"
  done
```

easy and convenient! check this one:

```
  #!/bin/bash
  while :
  do
    echo "Write your message (^C to stop this madness)"
    read message
    echo "This is your message: $message"
  done
```

The colon is telling while to run forever!

*while* can also read files each iteration takes as
value a row of the file.

```
  #!/bin/bash
  row_count=1
  while read a_row
  do
    echo "row $row_count: $a_row"
    row_count=$((row_count+1))
  done < example.sh
```

---
case
===

case statement is used to avoid a bunch of
if .. else .. end statements this is an example:

```
  #!/bin/bash
  echo "What's your name?"
  read name
  case $name in
    [aA]lex|Peter)
      echo "Hi $name"
      ;;
    Joe)
      echo "You suck $name
      ;;
    *)
      echo "You're awesome $name"
      ;;
  esac
```

input: `alex`
output: `Hi alex`

input: `Frank`
output: `You're awesome Frank`

Note we can use regex and multiple values for each
case, also a wildcard as the default case.

---
Functions
===

We can use small portions of code as functions and avoid
repeating that code.

```
  #!/bin/bash
  git_branch () {
    git branch --show-current
  }

  echo "Our current git branch is $(git_branch)"
```
output: Our current git branch is test

Functions also admit parameters

```
  #!/bin/bash
  create_branch () {
    branch_name=$1
    echo "Creating new branch $branch_name"
    git branch $branch_name
  }
  create_branch "my_branch"
```

output: `Creating new branch my_branch`

---
flow control
===

`$?` tells us the exit code of the last command, we have a ton of exit codes
but to resume code 0 means that there were no errors, every code > 0 is a
error exit code.

input: `$ echo 'hola'; [ $? -le 0 ] && echo "it went well" || echo "failed"`
output:
```
hola
it went well
```

---
External Apps - sed
===

*[sed](https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/)* is the acronym of stream editor and is a
powerfull app that can be used to find, search, replace, etc.

input: `$ cat text_file.txt`
output:
```
unix is great os. unix is opensource. unix is free os.
learn operating system.
unix linux which one you choose.
unix is easy to learn.unix is a multiuser os.Learn unix.
unix is powerful.
```

input: `$ sed 's/unix/linux/g` text_file.txt
output:
```
linux is great os. linux is opensource. linux is free os.
learn operating system.
linux linux which one you choose.
linux is easy to learn.linux is a multiuser os.Learn linux.
linux is powerful.
```

Note that the 's/' stands for search `unix` is the pattern we are looking for and
`linux` is the substitution patter, `/g` stands for global substitution. We can
also substitute just the first occurrence with `/1` or all of the from the nth
occurrence with `/3g`.

*sed* is super complete so please check the link below to see some more examples

---
External Apps - awk
===

*awk* stands for Aho, Weinberger and Kernighan the names of his creators. *awk* is a
DSL for text processing like sed and grep.

input: `$ ls -l`
output:
```
total 208
-rw-r--r--  1 raul.garcia@flywire.com  staff    269 Oct  6 10:13 README.md
-rwxr-xr-x  1 raul.garcia@flywire.com  staff    193 Oct  6 06:57 case.sh
-rwxr-xr-x  1 raul.garcia@flywire.com  staff     93 Oct  6 04:40 comments.sh
...
```
A silly example printing column 9th of each line output, and using *sed* to remove
file extensions.
input: `$ ls -l | grep rw | awk '{ print $9 }' | sed 's/\.[a-z]\{2\}//g'`
output:
```
README
case
comments
...
```

---
External Apps - jq
===

We can use jq to read and extract json files from console.

input: `$ jq . a_json_file`
output:
```
[
  {
    "roll": 3,
    "name": "Micheal",
    "batch": 29,
    "department": "CSE"
  },
  {
    "roll": 55,
    "name": "Lisa",
    "batch": 34,
    "department": "BBA"
  },
  {
    "roll": 12,
    "name": "John",
    "batch": 22,
    "department": "English"
  }
]
```

input: `$ jq '.[] | .name' a_json_file | sed 's/Micheal/Michael/1'`
output:
```
"Michael"
"Lisa"
"John"
```

---
Useful Links
===


[ShellScript](https://www.shellscript.sh/)
[sed examples](https://likegeeks.com/sed-linux/)
[jq](https://linuxhint.com/bash_jq_command/)
[awk examples](https://likegeeks.com/awk-command/)
[BashFAQ](http://mywiki.wooledge.org/BashFAQ)

---
