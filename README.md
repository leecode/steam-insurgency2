# steam-insurgency2
Dockerfile for deploying insurgency2 dedicated server

### QuickStart

```shell
$ docker run -d \
	-p 27015:27015 -p 27015:27015/udp \
	-v /home/steam/opt/server.cfg:/home/steam/insurgency/insurgency/cfg/server.cfg 
	cl4y/insurgency2:0.1 insurgency2-ds02
```

`/home/steam/opt/server.cfg` is the config file for your server.
`cl4y/insurgency2:0.1` is the name of the docker image.
