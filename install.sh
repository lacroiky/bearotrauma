#!/bin/bash

LOCAL_MOD_DIR="E:/SteamLibrary/steamapps/common/Barotrauma/LocalMods"
REPO_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
REPO_MOD_DIR="${REPO_DIR}/mods"

testmod () {
    if [ -z "$1" ];
    then
        echo "updating all mods in mods directory"
        for dir in "${REPO_MOD_DIR}"/*/
        do 
            DIR_PATH=${dir%*/}
            DIR_NAME=$(basename "${DIR_PATH}")
            echo "updating files for mod: ${DIR_NAME}"
            rm -rf "${LOCAL_MOD_DIR}/${DIR_NAME}"
            cp -r  "${DIR_PATH}" "${LOCAL_MOD_DIR}"
        done
    else
        echo "updating files for mod: ${1}"
        cp -r  "${REPO_MOD_DIR}/${1}" "${LOCAL_MOD_DIR}"
    fi
}

testmod "$1"