# backups
collection of scripts and systemd units for backing up various machines on my local network


# Systemd Units 

There are two units , one for the unit and the other for a timer unit. These units are copied to /etc/systemd/system and enabled once copied over. 

# Backup scripts 

* backup-home.sh -> script used by systemd units when the timer unit is triggered
* install.sh -> copies backup.sh to /usr/local/sbin and made executable  


# Future TODO

- [ ] add some form of validation in the backup script to verify integrity of files maybe a list of sha256 hashes in a text file which is compared to 
