#!/bin/bash

# clone the repo
git clone https://github.com/technonotes-hacker/Docker_Helloworld.git

cd Docker_Helloworld

REMOTE=origin
BRANCH=master
git fetch
if [[ "$(git rev-parse $BRANCH)" != "$(git rev-parse "$REMOTE/$BRANCH")" ]]; then
  # Run your script
git pull

# build the docker image 

docker build -t sathishpy1808/Docker_Helloworld:latest .

#push the docker image to docker hub
docker push sathishpy1808/Docker_Helloworld

#run the docker container 

docker run -d -p 8090:80 Docker_Helloworld
else
	echo " No change on $REMOTE "
fi

