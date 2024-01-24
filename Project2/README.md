# Robotics Software Engineer Nanodegree

## Project 2 ROS

### Basic commands

```bash

export GAZEBO_MODEL_PATH=/root/.gazebo/model:$GAZEBO_MODEL_PATH
export GAZEBO_MODEL_DATABASE_URI="http://models.gazebosim.org/"

source /opt/ros/kinetic/setup.bash
catkin_init_workspace
catkin_make
catkin_create_pkg my_robot

roslaunch <node> <>.launch
roslaunch my_robot world.launch

rosnode list
rosservice list

roslaunch my_robot world.launch
roslaunch ball_chaser ball_chaser.launch
rosrun rqt_image_view rqt_image_view
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
docker build -f "Dockerfile" -t mros:latest .
bash run_docker.sh
```

### Git

- <https://github.com/udacity/RoboND-myrobot>

### Models

- <https://github.com/osrf/gazebo_models>
- <https://3dwarehouse.sketchup.com/>

### Doc

- <http://wiki.ros.org/>
- <http://answers.ros.org/>
