# How to run bind9 locally

* [Running a DNS Server in Docker](https://medium.com/nagoya-foundation/running-a-dns-server-in-docker-61cc2003e899)
* [How to: Troubleshoot UNIX / Linux BIND DNS server problems](https://www.cyberciti.biz/tips/troubleshooting-bind-dns-2.html) 

The only changed from the great guide above was the Docker network setting:
```
sudo docker network create --subnet=10.10.0.0/16 bind9dns-net
```

And the subsequent commands to use the different network:
```
sudo docker run -d --rm --name=dns-server --net=bind9dns-net --ip=10.10.0.2 bind9 
```

```
sudo docker run -d --rm --name=host1 --net=bind9dns-net --ip=10.10.0.3 --dns=10.10.0.2 ubuntu:bionic /bin/bash -c "while :; do sleep 10; done"
sudo docker run -d --rm --name=host2 --net=bind9dns-net --ip=10.10.0.4 --dns=10.10.0.2 ubuntu:bionic /bin/bash -c "while :; do sleep 10; done"
```


## Network tools
The image we are using is missing ping and dns tools, so use the commands below to install them:
```
apt install iputils-ping
apt install dnsutils
```

## Testing
Use the host1 and host2 containers to test DNS settings by attaching to the container:
```
docker exec -it host1 bash
```

From a host we can test the following command to validate the DNS settings:
```
host -l astra.datastax.com
dig IP
dig hostname
```

And we can validate the settings of a host machine via */etc/nsswitch.com* file
