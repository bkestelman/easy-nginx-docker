if [[ $# < 1 ]]; then
	echo "Required arg: SITE_NAME"
	exit 1
fi
SITE_NAME=$1
export PORT=${2:-8080}
docker run -it --rm -p ${PORT}:${PORT} --mount type=bind,source="$(pwd)",target=/www ${SITE_NAME}
