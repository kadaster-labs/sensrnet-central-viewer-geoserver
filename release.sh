#!/bin/bash

## version file
VERSION_FILE='VERSION'

## import semver functions
. ./semver.sh  

function updateVersion() {

    CUR_VERSION=$(head -n 1 $VERSION_FILE)

    echo "  current version: [$CUR_VERSION]"

    local MAJOR=0  
    local MINOR=0  
    local PATCH=0  
    local SPECIAL=""

    semverParseInto $CUR_VERSION MAJOR MINOR PATCH SPECIAL  

    echo "  updating [$MODE] version"

    if [[ $MODE == "major" ]]; then
        MAJOR=$((MAJOR+1))
        MINOR=0
        PATCH=0
    fi
    if [[ $MODE == "minor" ]]; then
        MINOR=$((MINOR+1))
        PATCH=0
    fi
    if [[ $MODE == "patch" ]]; then
        PATCH=$((PATCH+1))
    fi

    NEW_VERSION="$MAJOR.$MINOR.$PATCH"

    echo "  new version: [$NEW_VERSION]"

    echo $NEW_VERSION > $VERSION_FILE
}

function printHelp() {
    echo "Usage:"
    echo "  release.sh <MODE>"
    echo "    <MODE>"
    echo "      - 'major' - update major release version"
    echo "      - 'minor' - update minor release version"
    echo "      - 'patch' - update patch release version"
    echo ""
    echo "Examples:"
    echo "  release.sh patch"
}


## Parse mode
if [[ $# -lt 1 ]] ; then
  printHelp
  exit 0
else
  MODE=$1
  updateVersion
fi
