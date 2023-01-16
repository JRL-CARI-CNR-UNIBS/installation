#!/bin/bash
catkin clean -y --workspace ~/projects/third_parties_ws/
catkin clean -y --workspace ~/projects/control_ws/
catkin clean -y --workspace ~/projects/planning_ws/
catkin clean -y --workspace ~/projects/perception_ws/
catkin clean -y --workspace ~/projects/sharework_ws/
catkin clean -y --workspace ~/projects/cells_ws/
catkin clean -y --workspace ~/projects/test_ws/

source  ~/projects/installation/compile_all_ws.bash
