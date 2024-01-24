#!/bin/bash
# xhost +local:root
xhost +

docker run -ti \
--gpus=all \
--privileged=true \
--cap-add=CAP_SYS_ADMIN \
--ipc=host \
--security-opt seccomp=unconfined \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /dev/bus/usb:/dev/bus/usb \
-v "/etc/localtime:/etc/localtime:ro" \
-e DISPLAY=$DISPLAY \
-e QT_X11_NO_MITSHM=1 \
-e NVIDIA_VISIBLE_DEVICES=all \
-e NVIDIA_DRIVER_CAPABILITIES=all \
-v $PWD:/workspace/Project1 \
-p 6006:6006 \
--name gazebo-run dgazebo:latest \
/bin/bash