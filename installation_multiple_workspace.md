# Installation on multiple (overlayed) workspaces
_see [here](https://catkin-tools.readthedocs.io/en/latest/mechanics.html#workspace-chaining-extending)_
 for details

Before start:

1) be sure that the .bashrc DOES NOT call a setup.bash of an existing workspace

2) you may want to change the directory path. If yes, adjust the instructions accordingly.

### workspace 1: third-parties repository
```
mkdir -p ~/projects/third_parties_ws/src
cd ~/projects/third_parties_ws
catkin init
wstool init src
mkdir rosinstall
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/third_parties.rosinstall -P ./rosinstall
wstool merge -t src rosinstall/third_parties.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs
```

The package _robotiq_3f_gripper_articulated_gazebo_plugins_ could fail during compilation, but it is not needed.

Now, add the repository to path:
```
echo "source /home/$USER/projects/third_parties/devel/setup.bash" >> ~/.bashrc
```
To make the change effective, open and close the terminals or run _source ~/.bashrc_ manually.


### workspace 2: control repository
```
mkdir -p ~/projects/control_ws/src
cd ~/projects/control_ws
catkin init
wstool init src
mkdir rosinstall
wget https://raw.githubusercontent.com/CNR-STIIMA-IRAS/rosdyn/master/rosdyn.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/rosdyn.rosinstall

wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/cnr_ros_control.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/cnr_ros_control.rosinstall

wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/controllers.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/controllers.rosinstall

wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
```

Now, add the repository to path:
```
echo "source /home/$USER/projects/control_ws/devel/setup.bash" >> ~/.bashrc
```
To make the change effective, open and close the terminals or run _source ~/.bashrc_ manually.


### workspace 3: motion and task planning repository
```
mkdir -p ~/projects/planning_ws/src
cd ~/projects/planning_ws
catkin init
wstool init src
mkdir rosinstall
wget https://raw.githubusercontent.com/CNR-STIIMA-IRAS/rosdyn/master/rosdyn.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/rosdyn.rosinstall

wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/motion_and_task_planning.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/motion_and_task_planning.rosinstall

wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
```

Now, add the repository to path:
```
echo "source /home/$USER/projects/planning_ws/devel/setup.bash" >> ~/.bashrc
```
To make the change effective, open and close the terminals or run _source ~/.bashrc_ manually.