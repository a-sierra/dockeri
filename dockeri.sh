#!/bin/bash

set -e
OPTION=$1
INSTANCE_ID=$2

case "$OPTION" in

    -h|--help)
      cat << EOF
Usage: dockeri [OPTIONS] CONTAINER_NAME|CONTAINER_ID

Docker inspect a container

OPTIONS:
  -h, --help            Help options
      --image           Get container's image id and name
      --name            Get container's name
  -m, --mounts          Get container's mounts
  -s, --state           Get container's state
  -e, --env             Get container's env variables
  -n, --networks        Get container's networks complete information
  -g, --gateway         Get container's list of networks and gateway addresses
  -ip, --ipaddress      Get container's list of networks and ip addresses
  -mac, --macadress     Get container's list of networks and mac addresses
      --alias           Get container's list of networks and aliases
  -p, --ports           Get container's list of published ports
      --args            Get container's args
      --cmd             Get container's CMD
      --entrypoint      Get conainer's entrypoint
EOF
        ;;

    --image)
        echo "$(docker inspect --format 'IMAGE ID: {{.Image}}{{printf "\n"}}IMAGE REPOSITORY AND TAG: {{ json .Config.Image }}' $INSTANCE_ID)"
        ;;

    --name)
        echo "$(docker inspect --format '{{lower .Name}}' $INSTANCE_ID)"
        ;;

    -m|--mounts)
        echo "$(docker inspect --format='{{ json .Mounts }}' $INSTANCE_ID)" | jq -M
        ;;

    -s|--state)
        echo "$(docker inspect --format='{{json .State}}' $INSTANCE_ID)" | jq -M
        ;;

    -e|--env)
        echo "$(docker inspect --format='{{json .Config.Env}}' $INSTANCE_ID)" | jq -M
        ;;

    -n|--networks)
        echo "$(docker inspect --format='{{json .NetworkSettings.Networks}}' $INSTANCE_ID)" | jq -M
        ;;

    -g|--gateway)
        echo "$(docker inspect --format='{{range $p, $conf := .NetworkSettings.Networks}}{{$p}} -> {{$conf.Gateway}}{{printf "\n"}}{{end}}' $INSTANCE_ID)"
        ;;

    -ip|--ipaddress)
        echo "$(docker inspect --format='{{range $p, $conf := .NetworkSettings.Networks}}{{$p}} -> {{$conf.IPAddress}}{{printf "\n"}}{{end}}' $INSTANCE_ID)"
        ;;

    -mac|--macadress)
        echo "$(docker inspect --format='{{range $p, $conf := .NetworkSettings.Networks}}{{$p}} -> {{$conf.MacAddress}}{{printf "\n"}}{{end}}' $INSTANCE_ID)"
        ;;

    --alias)
        echo "$(docker inspect --format='{{range $p, $conf := .NetworkSettings.Networks}}{{$p}} -> {{$conf.Aliases}}{{printf "\n"}}{{end}}' $INSTANCE_ID)"
        ;;

    -p|--ports)
        echo "$(docker inspect --format='{{ json .NetworkSettings.Ports}}' $INSTANCE_ID)" | jq -M
        ;;

    --args)
        echo "$(docker inspect --format='{{join .Args " , "}}' $INSTANCE_ID)"
        ;;

    --cmd)
        echo "env=$(docker inspect --format='{{json .Config.Cmd}}' $INSTANCE_ID)"
        ;;

    --entrypoint)
        echo "$(docker inspect --format='{{json .Config.Entrypoint}}' $INSTANCE_ID)"
        ;;

    *)
        docker inspect $@
        ;;

esac
