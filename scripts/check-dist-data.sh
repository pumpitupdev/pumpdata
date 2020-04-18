#!/usr/bin/env bash

# Root path of this script
readonly ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

set -e

integrity_check_dist_data()
{
    local data_dir="$1"
    local checksum_dir="$2"

    for checksum_file in "$checksum_dir"/*; do
        local filename="$(basename "$checksum_file")"
        local game_dir_name="${filename%.*}"

        echo ">>> Checking $game_dir_name..."

        local data_version_dir="$data_dir/$game_dir_name"

        if [ ! -d "$data_version_dir" ]; then
            echo "ERROR: Data directory $data_version_dir does not exist"
            exit 1
        fi

        cd "$data_dir" && "$ROOT_PATH"/md5sum-folder.sh check . < "$checksum_file"
    done
}

####################
# Main entry point #
####################

if [ "$#" -lt 2 ]; then
    echo "Integrity check distribution data"
    echo "Usage: $0 <path to data folder> <path to folder with checksum files>"
    exit 1
fi

data_dir="$1"
checksum_dir="$2"

integrity_check_dist_data "$data_dir" "$checksum_dir"