#!/usr/bin/bash

# This script expectes two arguments, $1 is a full path to a file, 
# and $2 is a text string which will be written within this file
if [ $# != 2 ]
then
    echo "This script expects two arguments"
    exit 1
fi

# Build the path to the file if the directory does not exist
DIR="$(dirname "$1")"
if [ ! -d "$DIR" ]
then 
    echo "Creating directory $DIR"
    mkdir -p "$DIR"
fi

# $1 must be a file that can be created
if touch "$1";
then
    # touch either created or touched the file, so we can edit it
    echo "$2" > $1
else
    echo "$1 could not be created or written to"
    exit 1
fi

exit 0