# SSH

## Permissions for `~/.ssh` and keys
- .ssh directory: `700 (drwx------)`
- public key (.pub file): `644 (-rw-r--r--)`
- private key (id_rsa): `600 (-rw-------)`

## SSH Hardening

This will work on most distros as long as they are using OpenSSH

https://www.digitalocean.com/community/tutorials/how-to-harden-openssh-on-ubuntu-18-04

### Basics
1. Make backup of config: `sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak`
2. Make edits: `sudo nano /etc/ssh/sshd_config`
3. Disable root login via SSH: `PermitRootLogin no`
4. Limit how many auth tries are allowed: `MaxAuthTries 3`
5. Reduce login grace period (how long a user has to auth after connecting): `LoginGraceTime 20`
6. Disable password auth (make sure you can ssh via keys!): `PasswordAuthentication no`
7. Don't allow empty passwords: `PermitEmptyPasswords no`
8. Turn off other types of auth:
   1. `ChallengeResponseAuthentication no`
   2. `KerberosAuthentication no`
   3. `GSSAPIAuthentication no`
9. Disable X11 forwarding: `X11Forwarding no`
10. Disable use of client PATH variables: `PermitUserEnvironment no`
11. Disable other misc options for forwards and tunneling if not needed:
    1. `AllowAgentForwarding no`
    2. `AllowTcpForwarding no`
    3. `PermitTunnel no`
12. Disable banner: `DebianBanner no` (might be `Banner no` on other systems)
13. Run sshd in test mode to confirm go config: `sudo sshd -t`
14. Reload the service (different on other systems): `sudo service sshd reload`