#!/bin/bash

# Script that uses rsync to backup users home directory 

ROOT_BACKUP_DIR="/mnt/backups/backups/home-backups"


if [ ! -d $ROOT_BACKUP_DIR/"$(hostname)-backups" ]; then # Creates users home backup dir if not present
    echo "INFO: Creating backup directory "
    mkdir $ROOT_BACKUP_DIR/"$(hostname)-backups"
    if [ $? -eq 0 ]; then
        echo "INFO: Target backup directory created successfully "
    fi
fi


BACKUP_DIR="$ROOT_BACKUP_DIR/$(hostname)-backups" # name of backup dir withing ROOT_BACKUP_DIR
if [ -f /var/log/backup.log ]; then # create log file if not present 
    touch /var/log/backup.log
fi
# rsync -avzh --progress /home/* $BACKUP_DIR > /var/log/backup.log
tar cvzf --exclude="/home/buhfur/.wine" $BACKUP_DIR/backup-$(date +"%Y-%m-%d_%H-%M-%S").tar.gz /home/

if [ $? -eq 0 ]; then
    echo "INFO: Home diretory backed up successfully " 
else
    echo "ERROR: Backup was not able to complete , see logs for details"
fi

