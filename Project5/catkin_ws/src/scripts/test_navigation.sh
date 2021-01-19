#!/bin/sh
xterm  -e  " source devel/setup.bash; roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=/workspace/catkin_ws/src/my_robot/worlds/house.world " &
sleep 7
xterm  -e  " source devel/setup.bash; roslaunch turtlebot_gazebo amcl_demo.launch map_file:=/workspace/catkin_ws/src/map/map.yaml " &
sleep 5
xterm  -e  " source devel/setup.bash; roslaunch turtlebot_rviz_launchers view_navigation.launch "