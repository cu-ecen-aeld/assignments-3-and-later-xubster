#!/bin/sh

#This script expectes two arguments, $1 is a path to a directory on the filesystem, 
#refered to as filedir, and $2 is a text string which will be searched within these files,
# refered to as searchstr
if [ $# != 2 ]
then
    echo "This script expects two arguments"
    exit 1
fi

# $1 must represent an existing directory
if [ ! -d "$1" ]
then
    echo "$1 is not an existing directory"
    exit 1
fi

# Search the number of files and lines
NUMFILES="$(grep -r "$2" "$1" -cH | wc -l)"
LINES="$(grep -r "$2" "$1" | wc -l)"

echo "The number of files are ${NUMFILES} and the number of matching lines are ${LINES}"



exit 0