#!/bin/bash

###
source /opt/ros/noetic/setup.bash

###
catkin build -cs --workspace ~/projects/third_parties_ws/  --mem-limit 30% -j 4
source ~/projects/third_parties_ws/devel/setup.bash

###
catkin build -cs --workspace ~/projects/control_ws/  --mem-limit 30% -j 4
source ~/projects/control_ws/devel/setup.bash

###
catkin build -cs --workspace ~/projects/planning_ws/  --mem-limit 30% -j 4
source ~/projects/planning_ws/devel/setup.bash

###
catkin build -cs --workspace ~/projects/perception_ws/  --mem-limit 30% -j 4
source ~/projects/perception_ws/devel/setup.bash

###
catkin build -cs --workspace ~/projects/sharework_ws/  --mem-limit 30% -j 4
source ~/projects/sharework_ws/devel/setup.bash
