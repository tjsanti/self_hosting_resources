#!/bin/bash

sudo docker volume create portainer_data

if [ "$1" = "upgrade" ]
then
	echo "Upgrading portainer!"
	sudo docker stop portainer
	sudo docker rm portainer
fi

echo "Pulling latest portainer image"
sudo docker pull portainer/portainer-ce:latest

echo "Installing latest portainer version"
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
		--restart=always \
 		-v /var/run/docker.sock:/var/run/docker.sock \
 		-v portainer_data:/data \
 		portainer/portainer-ce:latest
