# installation

install ros: follow the steps described in http://wiki.ros.org/ROS/Installation
install catkin_tools: follow the steps described in https://catkin-tools.readthedocs.io/en/latest/installing.html
install wstool: follow the steps described in http://wiki.ros.org/wstool
install and configure rosdep: follow the steps described in http://wiki.ros.org/rosdep


create a workspace (examples: /home/user/catkin_ws /home/user/projects/ros_ws)

mkdir -p ~/projects/ros_ws/src
cd ~/projects/ros_ws
catkin build
git clone https://github.com/JRL-CARI-CNR-UNIBS/installation
wstool init src
wstool merge -t src installation/base_cari.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin build -cs
