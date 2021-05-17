#!/bin/bash
set -e

sudo apt install git  build-essential libqt5charts5-dev
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
catkin build -cs --mem-limit 50%

source devel/setup.bash
echo "source /home/$USER/projects/third_parties/devel/setup.bash" >> ~/.bashrc


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
catkin config -j 2
catkin build -cs --mem-limit 30%


source devel/setup.bash
echo "source /home/$USER/projects/control_ws/devel/setup.bash" >> ~/.bashrc


mkdir -p ~/projects/planning_ws/src
cd ~/projects/planning_ws
catkin init
wstool init src
mkdir rosinstall
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/motion_and_task_planning.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/motion_and_task_planning.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%


source devel/setup.bash
echo "source /home/$USER/projects/planning_ws/devel/setup.bash" >> ~/.bashrc


mkdir -p ~/projects/perception_ws/src
cd ~/projects/perception_ws
catkin init
wstool init src
mkdir rosinstall
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/perception.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/perception.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%


source devel/setup.bash
echo "source /home/$USER/projects/perception_ws/devel/setup.bash" >> ~/.bashrc



mkdir -p ~/projects/sharework_ws/src
cd ~/projects/sharework_ws
catkin init
wstool init src
mkdir rosinstall
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/sharework_cembre.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/sharework_cembre.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%

source devel/setup.bash
echo "source /home/$USER/projects/sharework_ws/devel/setup.bash" >> ~/.bashrc


mkdir -p ~/projects/cells_ws/src
cd ~/projects/cells_ws
catkin init
wstool init src
mkdir rosinstall
wget https://raw.githubusercontent.com/JRL-CARI-CNR-UNIBS/installation/master/cells.rosinstall -P ./rosinstall
wstool merge -t src ./rosinstall/cells.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src -r -y
catkin config -j $(nproc --ignore=2)
catkin build -cs --mem-limit 50%

source devel/setup.bash
echo "source /home/$USER/projects/cells_ws/devel/setup.bash" >> ~/.bashrc


source ~/.bashrc
