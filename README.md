<table align="center"><tr><td align="center" width="9999">
<img src="./icon.png" align="center" width="150" alt="Dockeri icon">

dockeri
=====

A [Docker CLI](https://docs.docker.com/engine/reference/commandline/inspect/) wrapper to inspect a running container
</td></tr></table>




Installation (optional)
------------

1) Put `dockeri.sh` somewhere in your path. You can create a `bin` directory for these type of files.

```bash
$ mkdir -p ~/bin
$ cd ~/bin
$ wget https://raw.github.com/a-sierra/dockeri/master/dockeri.sh && chmod x dockeri.sh
```
2) Add an `dockeri` alias by adding the following line to your `~/.bashrc` file.

```
alias dockeri="~/bin/dockeri.sh"
```

3) Run
```bash
$ source ~/.bashrc
```

4) Ready! To get the list of options available, type:
```bash
$ dockeri --help
```

Usage
--------------
```bash
$ dockeri [OPTIONS] CONTAINER_NAME|CONTAINER_ID
```

For example:
```bash
$ dockeri -m some_postgres
[
  {
    "Type": "volume",
    "Name": "feebe0979d972b61ee96042657f844f40727035b5242265dacf43732b9747a32",
    "Source": "/var/lib/docker/volumes/feebe0979d972b61ee96042657f844f40727035b5242265dacf43732b9747a32/_data",
    "Destination": "/var/lib/postgresql/data",
    "Driver": "local",
    "Mode": "",
    "RW": true,
    "Propagation": ""
  }
]

```

Options
--------------

### -h, --help
Print help options

### --image
Get container's image id and name

### --name
Get container's name

### -m, --mounts
Get container's mounts

### -s, --state
Get container's state

### -e, --env
Get container's env variables

### -n, --networks
Get container's networks' information

### -g, --gateway
Get container's list of networks and gateway addresses

### -ip, --ipaddress
Get container's list of networks and ip addresses

### -mac, --macadress
Get container's list of networks and mac addresses

### --alias
Get container's list of networks and aliases

### -p, --ports
Get container's list of published ports

### --args
Get container's args

### --cmd
Get container's CMD

### --entrypoint
Get container's entrypoint
