#!/usr/bin/env bash

# Root path of this script
readonly ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

create_checksum_dist_data()
{
    local data_version_dir="$1"

    local game_version_name="$(basename "$data_version_dir")"

    cd "$data_version_dir/.." && "$ROOT_PATH"/md5sum-folder.sh create "$game_version_name"
}

####################
# Main entry point #
####################

if [ "$#" -lt 1 ]; then
    echo "Create checksum of distribution data folder"
    echo "Usage: $0 <path to game version data folder, e.g. 01_1st>"
    exit 1
fi

data_version_dir="$1"

create_checksum_dist_data "$data_version_dir"