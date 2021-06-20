# Command Line

## The Shell
- shell is just a program that takes your commands from the keyboard and sends them to the OS
- many types of shells: bash (bourne again shell), ksh, zsh, tsch
- `echo` will print the argument(s) to the screen
- `date` will print the current date
- `whoami` will print the currently logged in user's username

## pwd (Print Working Directory)
- everything in Linux is a file
- use `pwd` to see where you are currently located in the directory structure - the path

## cd (change directory)
- you can specifiy paths in two ways: relative and absolute
- the absolute way means you type the path from the root directory `/` onward
- relative means you can use these shortcuts in the path since they are relative to where you currently are:
	- `.`: current dir
	- `..`: parent directory
	- `~`: home directory of the current user
	- `-`: previous directory
- `cd` is used to change your current working directory
- running it by itself will take you to the current user's home dir

## ls (list directories)
- running `ls` will list the contents of the current directory
- you can specifiy a dir to see the contents of that dir
- by default, this won't show hidden files or dirs (those that start with a `.`)
	- `-a` to see all files and dirs
- `-l` will show you more info in the long format
	- includes from left to right:
		- file permissions
		- number of links
		- owner name
		- owner group
		- file size
		- timestamp of last modification
		- file/dir name
- multiple flags can be used as well so `-la` or `-al` would be a long listing of all files and dirs including hidden ones
- `ls` will list contents in alphabetical order, use `-r` to reverse the order
- `-t` to sort by mod time so that the newly modified files are first
- `-R` recursively lists dir contents

## touch
- creates an empty file in the specified dir
- if you `touch` an existing file, that files mod timestamp will update

## file
- in linux, filenames don't require extensions, the OS can usually tell
- `file <filename>` to see what kind of file a file is

## cat
- short for concatenate
- `cat <filename> <?filename>` will output the contents of a file (or multiple files together if multiple files are passed in)

## less
- use `less <filename>` to get a paged view of the contents
- similar to cat but more useful for longer files
- Use these keyboard shortcuts to navigate:
	- `q`: quit less and go back to shell
	- `Page up`, `Page down`, `Up`, `Down`: navigate using the arrow or page keys
	- `g`: move to beginning of the text file
	- `Shift` + `G`: move to end of text file
	- `/<word>`: search for a word
	- `h`: see help screen

## history
- use to see history of all remembered commands run by logged in user
- `!!` to run the last command you entered
- `Ctrl`+`R` to do a reverse search of previously used commands
	- keep hitting Ctrl+R to cycle through the results
- `clear` will clear the terminal display

## cp (copy)
- `cp <source> <destination>`
- used to copy files and dirs to another location
- use wildcards to copy multiple files/dirs
	- `*`: all single characters or strings (`cp *.jpeg /home/victor`)
	- `?`: represent one variable character (`cp ca?.jpg /home/victor` will copy both cat.jpg and car.jpg, if they exist)
	- `[]`: represent any char within the brackets (`cp ca[rt].jpg /home/victor` will copy both cat.jpg and car.jpg if they exist)
- `-r` to recursively copy all files and dirs within the source dir
- if you copy a file or dir to a place that already has a file or dir with that name, the destination data will be overwritten with the source
- `-i` will prompt before overwriting a file so you can choose whether or not to do so

## mv (move)
- used for moving files/dirs and renaming them; similar to cp
- `mv <current_file> <new_file>` to rename
- `mv <source> <destination>` to move
- multiple sources can be provided
- this can overwrite so use `-i` when needed
- make a backup of the destination file before overwriting with `-b`

## mkdir (make directory)
- used to create a new dir if it doesn't already exist
- can create multiple dirs at once
- `mkdir <new_dir_1> <new_dir_2>`
- `-p` to create subdirs: `mv -p books/hemingway/favs`

## rm (remove)
- `rm <file>` to delete a file or dir
- some protections are in place; if a file is write-protected `rm` will prompt before deletion
- `-f` to force deletion of files, regardless of write-protection (assuming correct permissions)
- `-i` to confirm interactively for each file
- `-r` to recursively delete files and dirs in a dir; can't delete dir without this
- use `rmdir <dir>` to delete a dir as well

## find
- `find <dir_to_search> -name <filename>`
- `-type d` to search for dirs: `find /home -type d -name myFolder`
- this is recursive by default

## help
- `help <command>` will usually work
- `echo --help` usually works too for executables

## man
- `man <command>` will provide the manual page if it exists

## whatis
- `whatis <command>` to get some info on the command i.e. what it does

## alias
- used to create an alias to a long or difficult command
- `alias foobar='ls -la'` so you can type `foobar` and `ls -la` will execute
- won't save after restart so need to add it to `~/.bashrc` or similar so it will stick
- remove with `unalias <alias>`

## exit and logout
- used to exit the shell and/or log off the current user