if [[ $# < 1 ]]; then
	echo "Required arg: SITE_NAME"
	exit 1
fi
SITE_NAME=$1
docker build . -t ${SITE_NAME} 
