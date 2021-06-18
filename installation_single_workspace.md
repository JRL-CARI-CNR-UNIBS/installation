# Installation on a single workspace

Before start:

1) be sure that the .bashrc DOES NOT call a setup.bash of an existing workspace

2) you may want to change the directory path. If yes, adjust the instructions accordingly.




### dependency:

install ros: follow the steps described in http://wiki.ros.org/ROS/Installation

install catkin_tools: follow the steps described in https://catkin-tools.readthedocs.io/en/latest/installing.html

install wstool: follow the steps described in http://wiki.ros.org/wstool

install and configure rosdep: follow the steps described in http://wiki.ros.org/rosdep


instal git and other depedencies
```
sudo apt install git  build-essential libqt5charts5-dev  qtquickcontrols2-5-dev
```

### Automatic installation  (STILL WORKING IN PROGRESS)

All the installation can be done by using [this script](automated_script_single_workspace.bash)
```
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/automated_script_single_workspace.bash
source automated_script.bash
```
To make the change effective, open and close the terminals or run _source ~/.bashrc_ manually.

## Manual installation

### create workspace
```
mkdir -p ~/projects/ros_ws/src
cd ~/projects/third_parties_ws
catkin init
mkdir rosinstall
wstool init src
```

Now, add the repository to path:
```
echo "source /home/$USER/projects/ros_ws/devel/setup.bash" >> ~/.bashrc
```
To make the change effective, open and close the terminals or run _source ~/.bashrc_ manually.


### Third parties repositories
```
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/third_parties.rosinstall -P ./rosinstall
wstool merge -t src rosinstall/third_parties.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
source devel/setup.bash
```

The package _robotiq_3f_gripper_articulated_gazebo_plugins_ could fail during compilation, but it is not needed.


### control repositories
```
wget https://raw.githubusercontent.com/CNR-STIIMA-IRAS/rosdyn/master/rosdyn.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/rosdyn.rosinstall

wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/cnr_ros_control.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/cnr_ros_control.rosinstall

wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/controllers.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/controllers.rosinstall

wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j 2
catkin build -cs --mem-limit 30%
source devel/setup.bash
```

### motion and task planning repositories

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
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/motion_and_task_planning.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/motion_and_task_planning.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
source devel/setup.bash
```

### perception repositories
```
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/perception.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/perception.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
source devel/setup.bash
```

### [optional]: Sharework cembre cell
you may need username and password for some repository.
```
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/sharework_cembre.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/sharework_cembre.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
source devel/setup.bash
```

### [optional]: CNR-STIIMA cell and simulated cells
you may need username and password for some repository.
```
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/cells.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/cells.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
source devel/setup.bash
```


### workspace [optional]: robothon
you may need username and password for some repository.
```
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/robothlon.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/robothlon.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%
source devel/setup.bash
```
