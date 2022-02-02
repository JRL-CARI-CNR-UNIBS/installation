# Qtcreator installation

## Easy way

Note: This method of installation is thorugh the main distribution repositories. It is an easy procedure but the version installed is not the latest one. The version installed on Ubuntu 20.04 has some annoying bugs (but they absolutely do not compromise the use of Qtcreator).

Install the IDE:
``` console
sudo apt install qtcreator
```
Then, install the necessary libraries and compilers and set Qt5 as default Qt version:
```console
sudo apt install build-essential
sudo apt install qt5-default
```
see _[here](qtcreator.md)_ to configure Qtcreator

## Nerdy way
To install a more recent version of Qtcreator than the one distributed by the main distribution repository, follow these steps:
1. Install required packages:
```console
sudo apt-get update
sudo apt-get install build-essential libgl1-mesa-dev -y
```
2. Download the online installer:
```console
wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run
```
3. Add execute permission:
```console
chmod a+x qt-unified-linux-x64-online.run
```
4. Run the installer
```console
./qt-unified-linux-x64-online.run
```
5. Follow the instructions to install the latest version of Qtcreator. Probably it will ask you to log in with your Qt account (or to create one). Note that the installer will automatically select to install some unnecessary extensions (more than 10 GB of download). Uncheck them, you will download only the IDE (less than 1 GB of download).
6. Add an alias to ~.bashrc file to be able to launch Qtcreator from the terminal (necessary to work with ROS):
```console
alias qtcreator='~/Qt/Tools/QtCreator/bin/qtcreator'
```
see _[here](qtcreator.md)_ to configure Qtcreator
