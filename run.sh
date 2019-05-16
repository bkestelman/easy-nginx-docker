if [[ $# < 1 ]]; then
	echo "Required arg: SITE_NAME"
	exit 1
fi
SITE_NAME=$1
PORT=${2:-8080} # default port 8080

existing_images=$(( $(docker images $SITE_NAME | wc -l) - 1 )) # count docker images tagged $SITE_NAME (-1 to skip header)
if [[ $existing_images == 0 ]]; then
	echo "Building new image"
	docker build . -t $SITE_NAME
else
	echo "Using existing image"
fi

docker run -it --rm -p ${PORT}:${PORT} --mount type=bind,source="$(pwd)",target=/www $SITE_NAME $PORT
