#!/bin/bash

sudo apt-get remove docker docker-engine docker.io

sudo apt-get update

sudo apt install docker.io

echo "Docker installed: $(docker --version)"
