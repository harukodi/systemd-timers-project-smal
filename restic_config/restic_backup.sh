#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
BACKUP_PATH="./data_folder"
REMOTE_PATH="/home/xia1997x-ct/restic-repo"
REMOTE_ADDRESS="restic-remote"
REMOTE_USER="xia1997x-ct"

source "$SCRIPT_DIR/.restic_env"

function create_backup {
    restic backup -r sftp:$REMOTE_USER@$REMOTE_ADDRESS:$REMOTE_PATH $BACKUP_PATH
}
create_backup