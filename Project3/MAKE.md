
```bash
source /opt/ros/kinetic/setup.bash
catkin_make
source devel/setup.bash

roslaunch my_robot world.launch
rosrun teleop_twist_keyboard teleop_twist_keyboard.py


```
