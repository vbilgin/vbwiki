## Text-Fu

# stdout (standard out)
- `echo hello world > peanuts.txt`
- processes in linux use i/o streams to receive input and return output
- normally, `echo` takes the input (stdin) from the keyboard and returns the output (stdout) to the screen
- i/o redirection allows us to redirect the output to a file or another command: `>`
- if a file doesn't already exist, it will create it. if it does exist, it will overwrite it
- `>>` to append instead of overwrite

# stdin (standard in)
- the usual source for stdin is the keyboard but we can also use files, output from other processes, and the terminal
- `<` for stdin redirection
- `cat < peanuts.txt > banana.txt`
- we direct the contents of peanuts.txt into cat and then direct the output of that into banana.txt

# stderr (standard error)
- stderr (errors from commands or programs) go to the screen by default
- we can redirect errors with `2>`:
	- `ls /fake/dir 2> peanuts.txt`
- what if we wanted to output both stdout and stderr?
	- `ls /fake/dir > peanuts.txt 2>&1`
	- sends the results of `ls` to the file and then tells stderr to go redirect to wherever stdout is pointing (peanuts.txt)
- shorter way: `ls /fake/dir &> peanuts.txt`
- want to get rid of errors completely?
	- `ls /fake/dir 2> /dev/null`

# pipe and tee
- use a pipe (`|`) to redirect output from one command to another
- basically takes the stdout of one command and makes it the stdin of the next
- what if you want to see the output and pipe it? use `tee`:
	- `ls | tee peanuts.txt`
	- you'll see the result and it'll be in the file

# env (environment)
- env variables such as `$HOME` and `$USER` exist and will change based on the situation
- see env variables with `env`
- access env variables by adding `$` to the front
- very important env var is `$PATH` - this a string of dirs separated by colons that the OS uses to find commands
	- download an executable and want to use it anywhere? either add the dir to the PATH or move the executable to one of the current PATH dirs

# cut
- extracts a portion of text from a file
- `cut -c 5 sample.txt` will output the fifth character (starting at 1, not 0) of every line of text in the file
- `cut -f 2 sameple.txt` will cut the text based on fields
	- default delimiter of a field is TAB, everything separated by a TAB is considered a different field
	- add `-d "<delimiter>"` to specifiy a custom delimiter
- can specifiy a range of chars or fields: `-c 2-5` (2nd thru 5th) or `-c 5-` (5th thru last) or `-c -5` (1st thru 5th)

# paste
- similar to `cat`, merges lines together in a file
- `paste -s sample.txt` will output the contents of the file merged together with the default delimiter of TAB
	- `-s` to make it one line
	- use `-d "<delimiter>"` to specify a custom delimiter

# head
- `head <file>` will output the first 10 lines of a file
- `-n <num>` to specify the number of lines

# tail
- same as `head` but for last 10 lines
- use `-n <num>` to specify number of lines
- use `-f` to follow the file (see changes as they occur)

# expand and unexpand
- `expand <file>` to change all TABs to spaces
- `unexpand -a <file>` to do the opposite

# join and split
- use `join <file_1> <file_2>` to join the files together by a common field:
```bash
file1.txt

1 John

2 Jane

3 Mary

file2.txt

1 Doe

2 Doe

3 Sue

$ join file1.txt file2.txt

1 John Doe

2 Jane Doe

3 Mary Sue
```
- joined by first field by default; fields have to be identical
```bash
file1.txt

John 1

Jane 2

Mary 3

file2.txt

1 Doe

2 Doe

3 Sue

```
- use `join -1 2 -2 1 file1.txt file2.txt` for the above
- use `split <file>` to split a file into different files (split once 1000 lines reached)
	- files named `x**` by default

# sort
- `sort <file>` to sort the lines of the file alphabetically
- `-r` to do a reverse sort
- `-n` to sort based on numerical value

# tr (translate)
- `tr a-z A-Z` will transform all lowercase letters to uppercase interactively
- `-d <characters>` to delete certain chars from the input

# uniq (unique)
- pass in a file and get only unique values as output: `uniq <file>`
- `-c` to get a count of how many times each value appeared
- `-u` to get only values that appeared once (truly unique)
- `-d` to get only values that occur more than once (duplicates)
- NOTE: `uniq` will not detect duplicates unless they are adjacent
	- to overcome this we can `sort` first and the pipe into `uniq`

# wc and nl
- `wc <file>` shows the total count of words in a file
- it displays
	- the number of lines (`-l`)
	- number of words (`-w`)
	- number of bytes (`-c`)
- pass the above flags to only get that value
- similar is `nl <file>` which outputs a numbered version of the lines in the file:
```
1. sdfasdf
2. dsdfsdf
```

# grep
- used to search for matching pattern
- `grep <pattern> <location_to_search>`
- `-i` to make it case insensitive
- you can use regex if needed
- `-E` to interpret patterns as extended regex
- `-F` to interpret patterns as fixed strings, not regex

