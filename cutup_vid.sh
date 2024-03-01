VIDEO="${1:?}"
DURATION="${2:?}"
NUM_CHUNKS="${3:?}"

SHORT_NAME=${VIDEO:10:25}
CHUNK_LEN=$((${DURATION}/${NUM_CHUNKS}))

mkdir "${VIDEO%.mp4}"

for ((d=0;d<=${NUM_CHUNKS};d++))
do
	START=$((${d}*${CHUNK_LEN}))
	NAME="${SHORT_NAME}-p${d}.mp4"
	ffmpeg -i "${VIDEO}" -acodec copy -vcodec copy -ss ${START} -t ${CHUNK_LEN} "${VIDEO%.mp4}/${NAME}"
#	echo "${VIDEO} : ${START} : ${CHUNK} : ${VIDEO%.mp4}/${NAME}"
done
