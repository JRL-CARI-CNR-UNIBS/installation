# installation

install ros: follow the steps described in http://wiki.ros.org/ROS/Installation

install catkin_tools: follow the steps described in https://catkin-tools.readthedocs.io/en/latest/installing.html

install wstool: follow the steps described in http://wiki.ros.org/wstool

install and configure rosdep: follow the steps described in http://wiki.ros.org/rosdep


instal git and other depedencies
```
sudo apt install git
sudo apt install libqt5charts5-dev
```

If some packages require a password, ask to Manuel Beschi
to permantely store the password

```
git config --global crendential.helper store
```


create a workspace (examples: /home/user/catkin_ws /home/user/projects/ros_ws)


configure workspace


```
mkdir -p ~/projects/ros_ws/src
cd ~/projects/ros_ws
catkin build
git clone https://github.com/JRL-CARI-CNR-UNIBS/installation
wstool init src
```

install by using rosinstall (in installation folder there are many rosinstall files, choose the desired ones)

```
wstool merge -t src installation/base_cari.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin build -cs
```

## Installation on multiple (overlayed) workspaces
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
rosdep install --from-paths src --ignore-src -r -y
catkin build -cs
```

The package _robotiq_3f_gripper_articulated_gazebo_plugins_ could fail during compilation, but it is not needed.

Now, add the repository to path:
```
gedit ~/.bashrc
```
add a line at the end:
```
source /home/[YOUR_USERNAME]/projects/third_parties_ws/devel/setup.bash
```
To make the change effective, open and close the terminals or run _source ~/.bashrc_ manually.


### workspace 2: common repository
```
mkdir -p ~/projects/common_ws/src
cd ~/projects/common_ws
catkin init
wstool init src
mkdir rosinstall
wget https://raw.githubusercontent.com/CNR-STIIMA-IRAS/rosdyn/master/rosdyn.rosinstall
wstool merge -t src ./rosdyn.rosinstall
rosdep install --from-paths src --ignore-src -r -y
catkin build -cs
```

The package _robotiq_3f_gripper_articulated_gazebo_plugins_ could fail during compilation, but it is not needed.

Now, add the repository to path:
```
gedit ~/.bashrc
```
add a line at the end:
```
source /home/[YOUR_USERNAME]/projects/third_parties_ws/devel/setup.bash
```
To make the change effective, open and close the terminals or run _source ~/.bashrc_ manually.

## troubleshooting

cannot connect with the UR10e robot:

1) do you ping the robot (ping 192.168.10.1)
2) can you login to the robot (ssh root@192.168.10.1  pwd:easybot)
3) do you open the firewall ports?  sudo ufw allow 50001/tcp  AND    sudo ufw allow 50002/tcp



## Useful commands

### catkin commands
* clean all the deleted packages
```
catkin clean --orphans
```



### Debug commands

* disable thread message in gdb:
```
nano ~/.gdbinit
set print thread-events off
```


### Git difftool

* see commited but non pushed files
```
git difftool HEAD origin/HEAD
```

* see last pushed files
```
git difftool HEAD^ HEAD
```

* see unstaged files (the files that you don't add with _git add -A_)
```
git difftool
```

* you can put these line in ~/.bashrc to create a shortcut
```
alias gitdiff_commit='git difftool HEAD origin/HEAD'
alias gitdiff_lastpush='git difftool HEAD^ HEAD'
alias gitdiff_unstaged='git difftool'
```
