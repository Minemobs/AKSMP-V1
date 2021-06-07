#!/bin/bash
get_latest_release() {
  curl --silent "https://api.github.com/repos/Minemobs/AKSMP-V1/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/'
}

LATEST_RELEASE_TAG="$(get_latest_release)"
LATEST_RELEASE=${LATEST_RELEASE_TAG:1}
wget https://github.com/Minemobs/AKSMP-V1/releases/download/"$LATEST_RELEASE_TAG"/AKSMP-SERVER-"$LATEST_RELEASE".zip
echo "$LATEST_RELEASE Latest Release Downloaded"
unzip AKSMP-SERVER-"$LATEST_RELEASE".zip
AKSMP_FOLDER=AKSMP-SERVER-"$LATEST_RELEASE"
rm mods/*
echo "Removed all mods"
cp -r "$AKSMP_FOLDER"/mods/*.jar mods/
echo "Added mods"
sleep 5s
rm AKSMP-SERVER-"$LATEST_RELEASE".zip
rm -rf AKSMP-SERVER-"$LATEST_RELEASE"
echo "Removed temp files"