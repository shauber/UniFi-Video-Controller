#!/bin/bash

docker build . -t nvr-test

docker run \
        --name nvr-test \
        --cap-add SYS_ADMIN \
        --cap-add DAC_READ_SEARCH \
        -p 1935:1935 \
        -p 6666:6666 \
        -p 7080:7080 \
        -p 7442:7442 \
        -p 7443:7443 \
        -p 7444:7444 \
        -p 7445:7445 \
        -p 7446:7446 \
        -p 7447:7447 \
        -v /tmp:/var/lib/unifi-video \
        -v /tmp:/var/lib/unifi-video/videos \
        -e TZ=America/New_York \
        -e PUID=99 \
        -e PGID=100 \
        -e DEBUG=1 \
	-it \
	--rm \
        nvr-test:latest
