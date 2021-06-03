#!/bin/bash

catkin build -cs --workspace ~/projects/third_parties_ws/
catkin build -cs --workspace ~/projects/control_ws/
catkin build -cs --workspace ~/projects/planning_ws/
catkin build -cs --workspace ~/projects/perception_ws/
catkin build -cs --workspace ~/projects/sharework_ws/
