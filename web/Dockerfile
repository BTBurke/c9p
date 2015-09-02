FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install build-essential git ruby wget curl python zsh

RUN cd /tmp && wget -qO- http://nodejs.org/dist/v0.12.7/node-v0.12.7.tar.gz | tar -xvz && cd node-v0.12.7 && ./configure && make && make install

RUN npm install -g npm
RUN npm install -g bower gulp npm-install-missing

RUN cd / && git clone https://github.com/c9/core.git c9 && cd c9 && scripts/install-sdk.sh

RUN groupadd -g 1000 btburke
RUN useradd -u 1000 -g sudo btburke

EXPOSE 9000

RUN chown -R btburke:btburke /c9
USER btburke
WORKDIR /c9
ENTRYPOINT ["node", "server.js", "-p", "9000", "-l", "0.0.0.0", "-w", "/home/btburke/project"]
CMD ["-a", ":"]
