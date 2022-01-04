#!/bin/sh
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
cd zootle
docker build -t zootle .
docker tag zootle 337392631707.dkr.ecr.us-east-1.amazonaws.com/zootle
docker push 337392631707.dkr.ecr.us-east-1.amazonaws.com/zootle
docker pull 337392631707.dkr.ecr.us-east-1.amazonaws.com/zootle
docker run -d -p 80:80 337392631707.dkr.ecr.us-east-1.amazonaws.com/zootle:latest