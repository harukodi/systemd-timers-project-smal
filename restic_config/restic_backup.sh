#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
BACKUP_PATH="/root/data_folder"
REMOTE_PATH="/root/remote_backup_folder"
REMOTE_ADDRESS="10.151.61.33"
REMOTE_USER="root"

source "$SCRIPT_DIR/.restic_env"

function create_backup {
    restic backup $BACKUP_PATH
}
create_backup

function send_backup_to_remote {
    scp -r $RESTIC_REPOSITORY $REMOTE_USER@$REMOTE_ADDRESS:$REMOTE_PATH
}
send_backup_to_remote