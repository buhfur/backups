#!/bin/bash

# Copy and activate systemd units 

if [[ ! -f /etc/systemd/system/backup.service || ! -f /etc/systemd/system/remote-backup.service ]]; then
    cp ../units/backup.service /etc/systemd/system/
    cp ../units/backup.service /etc/systemd/system/
fi 

if [[ ! -f /etc/systemd/system/backup.timer || ! -f /etc/systemd/system/remote-backup.timer ]]; then
    cp ../units/backup.timer /etc/systemd/system/
    cp ../units/remote-backup.timer /etc/systemd/system/
fi 


if [[ -f /etc/systemd/system/backup.timer || -f /etc/systemd/system/backup.service ]]; then # Activate and enable units , then daemon-reload 
    sudo systemctl enable backup.service
    sudo systemctl enable backup.timer
    sudo systemctl enable remote-backup.service
    sudo systemctl enable remote-backup.timer
    if [ $? -eq 0 ]; then
        echo "INFO: Systemd unit and timer have been copied and enabled successfully" 
    else
        echo "ERROR: Units were not able to be activated , please see logging for further info "
    fi
    systemctl daemon-reload 

fi

# Copy local and remote backup script to /usr/local/sbin 

sudo cp backup-home.sh /usr/local/sbin/
sudo cp remote-backup-home.sh /usr/local/sbin/

if [ $? -eq 0 ]; then
    echo "INFO: backup-home.sh script was successfully copied to /usr/local/sbin"
    echo "INFO: remote-backup-home.sh script was successfully copied to /usr/local/sbin"
else
    echo "ERROR: Units were not able to be activated , please see logging for further info "
fi

