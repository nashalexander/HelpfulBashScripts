#!/bin/bash

src=$1
dest=$2

echo "src  = $src"
echo "dest = $dest"

read -p "Are you sure? (y/n): " REPLY
echo "$REPLY"
if [[ $REPLY != [Yy] ]]
then
    echo "Aborting"
    exit 0
fi

rsync \
    --delete-after \
    --fuzzy \
    --delay-updates \
    --archive \
    --progress \
    --sparse \
    -A -X -U \
    "$src" "$dest"

# Tests
# - same file name updates
# - dest deletes files
# - stat values are the same
