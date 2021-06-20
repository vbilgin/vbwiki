# Permissions

## file permissions
- long listing for a file example: `drwxr-xr-x 2 pete penguins 4096 Dec 1 11:45 file.txt`
- four main parts to file's permissions: `drwxr-xr-x`
	- first is the type of file (`d` for dir and `-` for regular file)
	- next three are groups of three bits that denote actual permissions: `rwx`, `r-x`, and `r-x`
		- these represent the user permissions, group permissions, and other permissions
		- `r`: readable
		- `w`: writable
		- `x`: executable (an executable program)
		- `-`: empty

## modifying permissions
- use `chmod` with `+` or `-` to add or remove permissions
- for example: `chmod u+x myfile` means to add the execute bit to the user permissions for myfile
- change multiple permission bits: `chmod ug+w myfile` will add writable bit to both user and group permissions
- using numerical syntax:
	- 4: read
	- 2: write
	- 1: exec
- `chmod 755 myfile` will provide all permissions to user but only read and exec to group and other permissions

## ownership permissions
- you can change the user and group ownership of a file as well
- user: `sudo chown <username> <file/dir>`
- group: `sudo chgrp <group> <file/dir>`
- both: `sudo shown <user>:<group> <file/dir>`

## umask
- every file gets created with certain default permissions
- use `umask` to change those default permissions
- `umask` takes the numerical permission syntax but not added: `umask 021`
	- we say what we want to take away
	- so for the above example we would take no bits away from users
	- take write bit away from group
	- and take way exec from other
- this won't persist past a restart; need to modify `.profile` for that

## setuid
