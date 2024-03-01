extension=${1:?}
files=$(ls *.${extension})

echo "converting:"
echo "$files"

read -p "Are you sure? (y/n): " REPLY
echo "$REPLY"
if [[ $REPLY != [Yy] ]]
then
    echo "Aborting"
    exit 0
fi

while read file; do
    ffmpeg -i "${file}" -c:v libx265 -c:a aac "${file%.*}-new.mp4"
done <<< $files
