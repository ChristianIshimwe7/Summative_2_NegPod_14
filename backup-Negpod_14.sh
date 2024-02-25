#!/bin/bash

# Configuration variables
remote_host="64293e56bc62.3a2627c1.alu-cod.online"
remote_username="64293e56bc62"
remote_password="328d3b338a4ced526c9a"
remote_directory="/summative/1023-2024j"
local_directory="negpod_14-q1"

# Function to execute the backup
perform_backup() {
    echo "Starting backup..."

    # Use rsync to securely copy files to the remote server
    rsync -avz -e "sshpass -p $remote_password ssh -o StrictHostKeyChecking=no" "$local_directory" "$remote_username@$remote_host:$remote_directory"

    # Check if rsync command was successful
    if [ $? -eq 0 ]; then
        echo "Backup completed successfully."
    else
        echo "Backup failed. Please check your settings and try again."
    fi
}

# Function to restore from backup
restore_backup() {
    echo "Starting restore..."

    # Use rsync to securely copy files from the remote server to the local directory
    rsync -avz -e "sshpass -p $remote_password ssh -o StrictHostKeyChecking=no" "$remote_username@$remote_host:$remote_directory/" "$local_directory"

    # Check if rsync command was successful
    if [ $? -eq 0 ]; then
        echo "Restore completed successfully."
    else
        echo "Restore failed. Please check your settings and try again."
    fi
}

# Main menu
echo "Welcome to the ALU Backup Utility!"
echo "What would you like to do today?"
echo "1. Perform Backup"
echo "2. Restore from Backup"
echo "3. Exit"
read -p "Enter your choice:" choice

case $choice in
    1) perform_backup ;;
    2) restore_backup ;;
    3) echo "Exiting application." ;;
    *) echo "Invalid choice. Exiting application." ;;
esac