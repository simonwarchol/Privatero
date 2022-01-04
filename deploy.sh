#!/bin/sh
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker build -t zootle .
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 337392631707.dkr.ecr.us-east-1.amazonaws.com
docker push 337392631707.dkr.ecr.us-east-1.amazonaws.com/zootle
docker pull 337392631707.dkr.ecr.us-east-1.amazonaws.com/zootle
docker run -d -p 80:80 337392631707.dkr.ecr.us-east-1.amazonaws.com/zootle:latest