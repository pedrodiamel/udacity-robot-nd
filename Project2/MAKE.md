
```bash

byobu
mkdir -p /workspace/catkin_ws/src
cd /workspace/catkin_ws/src
source /opt/ros/kinetic/setup.bash
catkin_init_workspace

catkin_create_pkg my_robot
cd my_robot
mkdir launch
mkdir worlds

# create world.launch and robot_description.launch

cd /workspace/catkin_ws
catkin_make
source devel/setup.bash
roslaunch my_robot world.launch


cd /workspace/catkin_ws/src
catkin_create_pkg ball_chaser roscpp std_msgs message_generation
cd ..
catkin_make


source devel/setup.bash $ roslaunch my_robot world.launch
source devel/setup.bash $ rosrun ball_chaser drive_bot


source devel/setup.bash
rosservice call /ball_chaser/command_robot "linear_x: 0.5"
rosservice call /ball_chaser/command_robot "linear_x: 0.0"
rosservice call /ball_chaser/command_robot "linear_x: 0.0"
rosservice call /ball_chaser/command_robot "linear_x: 0.0"

rqt graph

```
