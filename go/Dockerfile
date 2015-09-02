FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install build-essential git ruby wget curl python zsh

RUN cd /tmp && wget -qO- http://nodejs.org/dist/v0.12.7/node-v0.12.7.tar.gz | tar -xvz && cd node-v0.12.7 && ./configure && make && make install
RUN cd /tmp && wget -qO- https://storage.googleapis.com/golang/go1.5.linux-amd64.tar.gz | tar -C /usr/local -xvz

RUN mkdir -p /home/ubunu/golang
ENV GOPATH /home/ubuntu/golang
ENV PATH $PATH:/home/ubuntu/golang/bin:/usr/local/go/bin


RUN cd / && git clone https://github.com/c9/core.git c9 && cd c9 && scripts/install-sdk.sh

EXPOSE 9000

WORKDIR /c9
ENTRYPOINT ["node", "server.js", "-p", "9000", "-l", "0.0.0.0", "-w", "/home/ubuntu"]
CMD ["-a", ":"]
