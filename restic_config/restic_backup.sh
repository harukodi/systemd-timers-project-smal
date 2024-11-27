#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
BACKUP_PATH="/root/data_folder"

source "$SCRIPT_DIR/.restic_env"

function create_backup {
    restic backup $BACKUP_PATH
}
create_backup