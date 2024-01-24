#!/bin/bash

xhost +
docker start gazebo-run
docker attach gazebo-run