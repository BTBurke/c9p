FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install git ruby wget

RUN cd /tmp && wget http://nodejs.org/dist/v0.10.9/node-v0.10.9-linux-x64.tar.gz && tar -C /usr -xvzf node-v0.10.9-linux-x64.tar.gz
RUN npm install -g npm

  
