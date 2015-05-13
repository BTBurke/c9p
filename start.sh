#!/bin/bash

NAME=$(docker inspect -f {{.Name}} $(docker ps -q -n 1) | cut -b 2-)


function install_etcdctl {

wget -qO- curl -L  https://github.com/coreos/etcd/releases/download/v2.0.10/etcd-v2.0.10-linux-amd64.tar.gz | tar -xvz  && mv etcd-v2.0.10-linux-amd64/etcdctl /usr/bin/  && rm -rf etcd-v2.0.10-linux-amd64

}

function start_etcd {

if [ $(docker ps -q -f image=coreos/etcd) = "" ]; then
	docker run -d -p 4001:4001 -p 2379:2379 coreos/etcd
fi
}

if [ $(which etcdctl) = "" ]; then
	echo "etcdctl is not installed. Installing and running the client and server"
	install_etcdctl
	start_etcd
fi


	

echo "LATEST START  " $NAME
