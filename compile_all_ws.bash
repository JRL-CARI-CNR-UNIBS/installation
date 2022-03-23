#!/bin/bash

ROOT_DIR=/home/hypatia/projects

###
source /opt/ros/noetic/setup.bash

###
catkin build -cs --workspace $ROOT_DIR/third_parties_ws/  --mem-limit 30% -j 4
source $ROOT_DIR/third_parties_ws/devel/setup.bash

###
catkin build -cs --workspace $ROOT_DIR/control_ws/  --mem-limit 30% -j 4
source $ROOT_DIR/control_ws/devel/setup.bash

###
catkin build -cs --workspace $ROOT_DIR/planning_ws/  --mem-limit 30% -j 4
source $ROOT_DIR/planning_ws/devel/setup.bash

###
catkin build -cs --workspace $ROOT_DIR/perception_ws/  --mem-limit 30% -j 4
source $ROOT_DIR/perception_ws/devel/setup.bash

###
catkin build -cs --workspace $ROOT_DIR/sharework_ws/  --mem-limit 30% -j 4
source $ROOT_DIR/sharework_ws/devel/setup.bash
