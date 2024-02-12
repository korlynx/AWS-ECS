#!/bin/bash

# install docker on your linux ubuntu environment 
sudo apt-get update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y