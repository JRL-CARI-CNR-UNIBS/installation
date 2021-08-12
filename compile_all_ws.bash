#!/bin/bash

catkin build -cs --workspace ~/projects/third_parties_ws/  --mem-limit 30%
catkin build -cs --workspace ~/projects/control_ws/  --mem-limit 30%
catkin build -cs --workspace ~/projects/planning_ws/  --mem-limit 30%
catkin build -cs --workspace ~/projects/perception_ws/  --mem-limit 30%
catkin build -cs --workspace ~/projects/sharework_ws/  --mem-limit 30%
