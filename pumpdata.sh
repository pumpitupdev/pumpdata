#!/usr/bin/env sh

# Root path of this script
readonly ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$1" in
    check-dist-data)
        "$ROOT_PATH/scripts/check-dist-data.sh" "$ROOT_PATH/data" "$ROOT_PATH/checksum/dist"
        ;;
    check-game-assets)
        "$ROOT_PATH/scripts/check-game-assets.sh" "$ROOT_PATH/data" "$ROOT_PATH/checksum/game"
        ;;
    create-checksum-dist-data)
        "$ROOT_PATH/scripts/create-checksum-dist-data.sh" "${@:2}"
        ;;

    create-checksum-game-assets)
        "$ROOT_PATH/scripts/create-checksum-game-assets.sh" "${@:2}"
        ;;
    *)
        echo "Pump It Up Data (pumpdata) management tool"
        echo "  check-dist-data: Check if the distribution data placed in data is not corrupted."
        echo "  check-game-assets: Check if the actual game assets are not corrupted."
        echo "  create-checksum-dist-data: Create checksums of distribution data of one game."
        echo "  create-checksum-game-assets: Create checksums for the game assets of one game of the distribution data."
        exit 1
esac