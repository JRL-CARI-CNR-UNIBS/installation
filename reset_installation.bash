#!/bin/bash

echo "1. Make sure that the .bashrc DOES NOT call a setup.bash of an existing workspace (comment them)."
echo "2. Execute the command in a new terminal (no sourced workspaces)."
read -p "3. Done? [y/n]" choice
case "$choice" in
  y|Y ) echo "yes";;
  n|N ) echo "no, quitting script."; return;;
  * ) echo "invalid, quitting script."; return;;
esac

catkin clean -y --workspace ~/projects/third_parties_ws/
catkin clean -y --workspace ~/projects/control_ws/
catkin clean -y --workspace ~/projects/planning_ws/
catkin clean -y --workspace ~/projects/perception_ws/
catkin clean -y --workspace ~/projects/sharework_ws/
catkin clean -y --workspace ~/projects/cells_ws/
catkin clean -y --workspace ~/projects/test_ws/

source  ~/projects/installation/compile_all_ws.bash
