## User Management

# users and groups
- in traditional OSs, users and groups are used for access and permissions
- when a process is started by a user, the owner of the process will be that user
- file access and ownership is governed by users and groups
- each user has their own home directory (usually) and it can be find in `/home/username` in most distros
- system uses UIDs (user IDs) to manage users but humans use usernames
- groups are just collections of users; system assigns them GIDs (group IDs)
- in linux, there are non-human users too; these users run system processes (daemons)
- one of the most important users is `root` or `superuser`
	- root is the most powerful user on the system
	- root can access any file/dir and kill any process
	- don't want to be root all the time as that is dangerous
	- if possible, run a command as root via `sudo` (superuser do)

# root
- use `su` or `su -` to get a root shell (`su` is for substitute user)
	- this can used with a username to act as that user, not just root
- who can use `sudo`? the file `/etc/sudoers` says who. use `visudo` to edit it

# /etc/passwd
- to see what username is mapped to what UID, look at `/etc/passwd`
- lines look like `a:x:1000:1000:,,,:/home/a:/bin/bash`
- format is this: `[username]:[user's password]:[UID]:[GID]:[GECOS]:[user's home dir]: [user's shell]`
	- password isn't actually stored here but in `/etc/shadow`
		- this field will have `x` if the password is encrypted and stored in `/etc/shadow`
		- `*` if user doesn't have login access
		- if blank, there is no password
	- GECOS is a comma-delimited field where info like user's real name can be put
- human and system users are listed in this file
- you can edit this file by hand with `vipw` but better to use other tools

# /etc/shadow
- this has info about user auth so it requires sudo to read
- lines look like: `a:$6$ImMe6v6yyz1XoGHN$y8XPBMCTp11AV0INRNJc7eO8eXppXqVlqstB3ftR3iajOgxAdXmlQ9P8RYAT6XpxfraCHQJAS3CnG6qwjg9Q71:18692:0:99999:7:::`
- format: `[username]:[encrypted password]:[date of last pass change]:[min password age]:[max password age]:[password warning period]:[password inactivity period]:[accoutn expiration date]:[reserved field for future use]`

# /etc/group
- shows different groups and their permissions
- lines look like `root:x:0:`
- format: `[group name]:[group password]:[GID]:[list of users in group]`
- `groups` will show you what groups you're in

# user mgmt tools
- `adduser` and `useradd` both create new users
	- `adduser` has more features like making a home dir
	- need to run with sudo
- `sudo userdel <user>` to delete user
- `passwd <user>` to change password