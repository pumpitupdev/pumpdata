#!/usr/bin/env bash

# Root path of this script
readonly ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

create_checksum_game_assets()
{
    local data_version_dir="$1"

    cd "$data_version_dir" || exit 1

    if [ -d "game" ]; then
        "$ROOT_PATH"/md5sum-folder.sh create game
    elif [ -e "game.zip" ]; then
        unzip game.zip > /dev/null
        "$ROOT_PATH"/md5sum-folder.sh create game
        rm -r "game"
    else
        echo "ERROR: Cannot find unpacked game dir or game.zip"
    fi
}

####################
# Main entry point #
####################

if [ "$#" -lt 1 ]; then
    echo "Create checksum of game assets of a distribution data folder"
    echo "Usage: $0 <path to game version data folder, e.g. 01_1st>"
    exit 1
fi

data_version_dir="$1"

create_checksum_game_assets "$data_version_dir"