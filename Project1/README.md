# Robotics Software Engineer Nanodegree

## Project 1 Gazebo

### Basic commands

```bash
source /opt/ros/humble/setup.bash

```

### Install

```bash
curl -sSL http://get.gazebosim.org | sh
```

### Docker

- <https://github.com/facontidavide/ros-docker-gazebo>
- <https://github.com/Seanmatthews/ros-docker-gazebo>

```bash
sudo apt-get install -y usbutils
docker build -f "Dockerfile" -t dgazebo:latest .
bash run_docker.sh

mkdir build
cd build/
cmake ..
make -j4

cd ..
export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:/workspace/Project1/build
gazebo world/udacityOffice.world


```

### Git

- <https://github.com/udacity/RoboND-myrobot>

### Models

- <https://github.com/osrf/gazebo_models>
- <https://3dwarehouse.sketchup.com/>

### Doc

- <http://gazebosim.org/tutorials>
