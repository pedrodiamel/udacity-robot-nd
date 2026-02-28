FROM osrf/ros:jazzy-desktop

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    byobu \
    vim \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace/Project1