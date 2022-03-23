# Installation

## Install ROS packages

Installation of the JRL-CARI Workspace can be done in a single workspace or a multiple workspaces.
The second saves you times during compilation.

### Installation on a single workspace
_see [here](installation_single_workspace.md)_


### Installation on multiple (overlayed) workspaces
_see [here](installation_multiple_workspace.md)_

## Install QtCreator
_see [here](qt_creator_installation.md)_

## Configure QtCreator
_see [here](qtcreator.md)_

## Configure Atom
_see [here](atom.md)_

## Troubleshooting with Sharework cell

Cannot connect to the UR10e robot:

1) can you ping the robot (ping 192.168.10.1)?
2) if yes, can you login to the robot (ssh root@192.168.10.1  pwd:easybot)?
3) if yes, did you open the firewall ports?  sudo ufw allow 50001/tcp AND sudo ufw allow 50002/tcp

## Useful stuff

### Catkin commands
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

### Git commands
_see [here](git_useful_commands.md)_

### Bash tips
Copy these commands into your .bashrc file:
* see git branch name next to the path in the terminal. It also show the status of the branch (unstaged files, sync with remote), see [here](https://jon.sprig.gs/blog/post/1940) for details

```
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
GIT_PS1_DESCRIBE_STYLE='contains'
GIT_PS1_SHOWCOLORHINTS='y'
GIT_PS1_SHOWDIRTYSTATE='y'
GIT_PS1_SHOWSTASHSTATE='y'
GIT_PS1_SHOWUNTRACKEDFILES='y'
GIT_PS1_SHOWUPSTREAM='auto'
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(__git_ps1)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt
```

* automatic ls after cd or roscd

```
function cd {
    builtin cd "$@" && ls -F
    }
```
