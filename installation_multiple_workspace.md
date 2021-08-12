# Installation on multiple (overlayed) workspaces
_see [here](https://catkin-tools.readthedocs.io/en/latest/mechanics.html#workspace-chaining-extending)_
 for details on the usage of multiple workspaces.

 # Table of Contents
 1. [Before start](#Before-start)
 2. [dependency](#dependency)
 3. [Automatic installation  ](#automatic-installation)
 4. [Manual installation](#manual-installation)
 5. [Utilities](#Utilities)


## Before start

1) be sure that the .bashrc DOES NOT call a setup.bash of an existing workspace

2) you may want to change the directory path. If yes, adjust the instructions accordingly.





## dependency

install ros: follow the steps described in http://wiki.ros.org/ROS/Installation

install catkin_tools: follow the steps described in https://catkin-tools.readthedocs.io/en/latest/installing.html

install wstool: follow the steps described in http://wiki.ros.org/wstool

install and configure rosdep: follow the steps described in http://wiki.ros.org/rosdep


instal git and other depedencies
```
sudo apt install git  build-essential libqt5charts5-dev libqt5quickcontrols2-5 qtquickcontrols2-5-dev
```

## Automatic installation  
(STILL WORKING IN PROGRESS)

All the installation can be done by using [this script](automated_script.bash)
```
wget  --backups=1 https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/automated_script.bash
source automated_script.bash
```
To make the change effective, open and close the terminals or run _source ~/.bashrc_ manually.

## Manual installation

### workspace 1: third-parties repository
```
mkdir -p ~/projects/third_parties_ws/src
cd ~/projects/third_parties_ws
catkin init
wstool init src
mkdir rosinstall
wget  --backups=1 https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/third_parties.rosinstall -P ./rosinstall
wstool merge -t src rosinstall/third_parties.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
```

The package _robotiq_3f_gripper_articulated_gazebo_plugins_ could fail during compilation, but it is not needed.

Now, add the repository to path:
```
echo "source /home/$USER/projects/third_parties_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```


### workspace 2: control repository
```
mkdir -p ~/projects/control_ws/src
cd ~/projects/control_ws
catkin init
wstool init src
mkdir rosinstall
wget  --backups=1 https://raw.githubusercontent.com/CNR-STIIMA-IRAS/rosdyn/master/rosdyn.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/rosdyn.rosinstall

wget  --backups=1 https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/cnr_ros_control.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/cnr_ros_control.rosinstall

wget  --backups=1 https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/controllers.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/controllers.rosinstall

wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j 2
catkin build -cs --mem-limit 30%
```

Now, add the repository to path:
```
echo "source /home/$USER/projects/control_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```


### workspace 3: motion and task planning repository

Before the installation you need to install mongo:
```
sudo apt install libbson-dev  libmongoc-dev
mkdir -p ~/projects/mongo_src
cd ~/projects/mongo_src
curl -OL https://github.com/mongodb/mongo-cxx-driver/archive/r3.1.4.tar.gz
tar -xvf r3.1.4.tar.gz
cd mongo-cxx-driver-r3.1.4/build
cmake . .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local
sudo cmake --build . --target EP_mnmlstc_core
cmake --build .
sudo cmake --build . --target install
```
then you can run:
```
mkdir -p ~/projects/planning_ws/src
cd ~/projects/planning_ws
catkin init
wstool init src
mkdir rosinstall
wget  --backups=1 https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/motion_and_task_planning.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/motion_and_task_planning.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
```

Now, add the repository to path:
```
echo "source /home/$USER/projects/planning_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

### workspace 4: perception repository
```
mkdir -p ~/projects/perception_ws/src
cd ~/projects/perception_ws
catkin init
wstool init src
mkdir rosinstall
wget  --backups=1 https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/perception.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/perception.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
```

Now, add the repository to path:
```
echo "source /home/$USER/projects/perception_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```



### workspace [optional]: Sharework cembre cell
you may need username and password for some repository.
```
mkdir -p ~/projects/sharework_ws/src
cd ~/projects/sharework_ws
catkin init
wstool init src
mkdir rosinstall
wget  --backups=1 https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/sharework_cembre.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/sharework_cembre.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
```

Now, add the repository to path:
```
echo "source /home/$USER/projects/sharework_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```


### workspace [optional]: CNR-STIIMA cell and simulated cells
you may need username and password for some repository.
```
mkdir -p ~/projects/cells_ws/src
cd ~/projects/cells_ws
catkin init
wstool init src
mkdir rosinstall
wget  --backups=1 https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/cells.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/cells.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
```

Now, add the repository to path:
```
echo "source /home/$USER/projects/cells_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```



### workspace [optional]: robothon
you may need username and password for some repository.
```
mkdir -p ~/projects/robothon_ws/src
cd ~/projects/robothon_ws
catkin init
wstool init src
mkdir rosinstall
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/robothon.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/robothon.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
```

Now, add the repository to path:
```
echo "source /home/$USER/projects/robothon_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

## Utilities
you may want to use some shortcut to:
-  (re)load the environment variables

- check the status of the workspaces (what packages have been modified)

- update all the repositories

Let's suppose that you download [this repository](https://github.com/JRL-CARI-CNR-UNIBS/installation) in ~/projects/installation, then you should add the following lines to the file ~/.bashrc

```
alias rr='source ~/projects/installation/source_all_ws.bash'
alias status_ws='source ~/projects/installation/status_of_ws.bash'
alias update_ws='source  ~/projects/installation/update_all_ws.bash'
alias compile_ws='source  ~/projects/installation/compile_all_ws.bash'
```
