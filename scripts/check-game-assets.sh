#!/usr/bin/env bash

# Root path of this script
readonly ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

set -e

integrity_check_game_assets()
{
    local data_dir="$1"
    local checksum_dir="$2"

    for checksum_file in "$checksum_dir"/*; do
        local filename="$(basename "$checksum_file")"
        local game_dir_name="${filename%.*}"

        echo ">>> Checking $game_dir_name..."

        local data_version_dir="$data_dir/$game_dir_name"

        cd "$data_version_dir" || exit 1

        if [ -d "game" ]; then
            echo "Checking folder game..."
            "$ROOT_PATH"/md5sum-folder.sh check . < "$checksum_file"
        elif [ -e "game.zip" ]; then
            echo "Checking package game.zip..."
            unzip game.zip > /dev/null
            "$ROOT_PATH"/md5sum-folder.sh check . < "$checksum_file"
            rm -r "game"
        else
            echo "ERROR: Cannot find unpacked game dir or game.zip"
        fi
    done
}

####################
# Main entry point #
####################

if [ "$#" -lt 2 ]; then
    echo "Integrity check game assets of distribution data"
    echo "Usage: $0 <path to data folder> <path to folder with checksum files>"
    exit 1
fi

data_dir="$1"
checksum_dir="$2"

integrity_check_game_assets "$data_dir" "$checksum_dir"