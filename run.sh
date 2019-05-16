if [[ $# < 1 ]]; then
	echo "Required arg: SITE_NAME"
	exit 1
fi
SITE_NAME=$1
PORT=${2:-8080} # default port 8080

docker_build() {
	docker build . -t $SITE_NAME
}
docker_run() {
	docker run -it --rm -p ${PORT}:${PORT} --mount type=bind,source="$(pwd)",target=/www $SITE_NAME $PORT
}
docker_stop() {
	docker stop --name $SITE_NAME
}

existing_images=$(( $(docker images $SITE_NAME | wc -l) - 1 )) # count docker images tagged $SITE_NAME (-1 to skip header)
if [[ $existing_images == 0 ]]; then
	echo "Building new image"
	docker_build
else
	echo "Using existing image"
fi

running_containers=$(( $(docker ps --filter expose=$PORT | wc -l) - 1 )) # count running containers using $PORT (-1 to skip header)
if [[ $running_containers > 0 ]]; then
	echo "Container already running on $PORT."
else
	docker_run
fi
