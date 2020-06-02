#!/bin/sh
function run_docker(){
    local cmd
    ports="-p 0.0.0.0:7707:7707/udp\
 -p 0.0.0.0:7708:7708/udp\
 -p 0.0.0.0:7717:7717/udp\
 -p 0.0.0.0:28852:28852/udp\
 -p 0.0.0.0:28852:28852/tcp\
 -p 0.0.0.0:8075:8075/tcp\
 -p 0.0.0.0:20560:20560/udp\
 -p 0.0.0.0:20560:20560/tcp "
    cmd="docker run --rm -it --name kf1-docker-CM "
    cmd+="$ports"
    cmd+="--env-file=env_file "
    cmd+="vel7an/kf1-docker:CM"
    echo "$cmd"
    exec $cmd
}

run_docker