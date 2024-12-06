#!/bin/bash

# template script which moves specifed backups in directory to corresponding location on remote backups 


LBACKUP_DIR="" # change this to the local directory you would like backed up 
RBACKUP_DIR="" # same but with the name of the remote backup location  
REMOTE_NAME=""


if [ -d $BACKUP_DIR ]; then
    # Copy directory using rclone and write to log file 
    rclone copy $LBACKUP_DIR $REMOTE_NAME:$RBACKUP_DIR
    if [ $? -eq 0 ]; then
        echo "INFO: All files in target $LBACKUP_DIR have been successfully copied to $RBACKUP_DIR"
    fi
fi 



