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
