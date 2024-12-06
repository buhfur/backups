# backups
collection of scripts and systemd units for backing up various machines on my local network


# Systemd Units 

* backup-home.service -> unit for triggering backup-home.sh script 
* backup-home.timer -> timer unit to activate backup-home.service 
* remote-backup-home.service -> unit which uses template script to copy backups off site, requires configuration to be usuable 
* remote-backup-home.timer -> Timer unit which triggers remote-backup-home.service unit 

# Backup scripts 

* backup-home.sh -> script used by systemd units when the timer unit is triggered
* install.sh -> copies backup.sh to /usr/local/sbin and made executable  
* remote-backup-home -> template script which copies specified directories to off site cloud provider using rclone 

# Installation & Configuration                                                             

## Remote backup configuration 

* You will need to have your configuration setup for rclone with your off-site cloud provider.

* In the remote-backup-script.sh , modify the following lines to configure which directories you would like backed up 
```bash
LBACKUP_DIR="/some/directory/here"
RBACKUP_DIR="backups/"
```
> Note : RBACKUP_DIR should be the name 

## One off script 
```bash
git clone https://github.com/buhur/backups ~/ && sudo bash $HOME/backups/scripts/install.sh
```
# Future TODO

- [ ] off-site backups using rclone 
- [ ] add some form of validation in the backup script to verify integrity of files maybe a list of sha256 hashes in a text file which is compared to 

