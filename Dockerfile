FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install build-essential git ruby wget curl python

RUN cd /tmp && wget -qO- http://nodejs.org/dist/v0.12.2/node-v0.12.2.tar.gz | tar -xvz && cd node-v0.12.2 && ./configure && make && make install

RUN npm install -g npm
RUN npm install -g bower gulp

RUN cd / && git clone https://github.com/c9/core.git c9 && cd c9 && scripts/install-sdk.sh

EXPOSE 8181
RUN mkdir -p /workspace

WORKDIR /tmp
RUN wget -qO- https://github.com/coreos/etcd/releases/download/v2.0.10/etcd-v2.0.10-linux-amd64.tar.gz | tar -xvz && mv etcd-v2.0.10-linux-amd64/etcdctl /usr/bin/ 

WORKDIR /c9
ENTRYPOINT ["node", "server.js", "-p", "8181", "-l", "0.0.0.0", "-w", "/workspace"]
CMD ["-a", ":"]

  
