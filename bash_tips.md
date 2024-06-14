# Bash tips for `.bashrc` or `.profile`

(Ugly scripts that can be helpful)

**Important:** To have the workspace-related scripts working, the workspace name should end with `_ws` and should not contain other underscores

## Move to workspace root from an inner directory

```bash
alias cdws=cd $(pwd | sed -e s:_ws.*:_ws:) # Jump back to ws folder
```

```bash
alias ss="cdws && to_source && cd -"
```

## Source workspaces with list
```bash
to_source() {
    PROJECT_DIR="$HOME/projects"
  __ROS_DISTRO__=humble
  ROS_ROOT="/opt/ros/${__ROS_DISTRO__}/setup.bash"
  idx=0
  echo "Project Directory: ${PROJECT_DIR}"
  if [[ ${ROS_DISTRO} != "" ]]; then
    echo "* Distro already sourced: ${ROS_DISTRO}"
  fi

  source ./install/setup.bash
  if [[ $? -ne 0 ]]; then
    echo -e "\n############################"
    echo      "## No workspace to source ##"
    echo -e   "############################\n"
    return 0
  fi
  read -r -a WORKSPACES <<< $(sed -E -e "s:$HOME/projects/([A-Za-z]*_ws)/install:\1:g" -e "s/\:/ /g" <(echo $COLCON_PREFIX_PATH))
  echo "sourcing [${#WORKSPACES[@]}]: ROS Distribution ($ROS_DISTRO)"
  for ((idx=${#WORKSPACES[@]}-1; idx>=0; idx--)); do
    echo "sourcing [$((${idx}))]: ${WORKSPACES[idx]}"
  done
}
alias ss="to_source"
```

To source inside any child directory of the workspace

```bash
alias ss="cdws && to_source && cd -"
```

## Git and WS integration in prompt

- Only git:

```bash
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
# From here change the prompt
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(__git_ps1)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt
```

- Git and WS:

```bash
ros_ws() {
    ws=$(sed -E -e "s:$HOME/projects/([A-Za-z]*_ws)/install:\1:g" -e "s/([A-Za-z]*_ws):.*/\1/g"  <(echo $COLCON_PREFIX_PATH))
    if [[ -z "$ws" ]]; then
      if [[ -z $ROS_DISTRO ]]; then
        echo ""
      else
        echo [$ROS_DISTRO]
      fi
    else
        echo [$ws]
    fi
}


ps1_old=$PS1
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;31m\]$(__git_ps1) \[\033[01;35m\]$(ros_ws) 
 \[\033[01;34m\]\w\[\033[00m\]\$ '
```

## Change RMW
Obviously you have to install them

```bash
set_rmw() {
  if [[ -z $1 ]]; then
    echo "set_rmw [number]"
    echo -e "RMW versions:\n\t1 - Fast DDS\n\t2 - Cyclone DDS\n\t3 - Connext DDS\n"
  else
    case $1 in
    1)
      export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
      echo "rmw_fastrtps_cpp"
      ;;
    2)
      export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
      echo "rmw_cyclonedds_cpp"
      ;;
    3)
      export RTI_LICENSE_FILE=/opt/rti.com/rti_connext_dds-6.0.1/rti_license.dat
      source /opt/rti.com/rti_connext_dds-6.0.1/resource/scripts/rtisetenv_x64Linux4gcc7.3.0.bash
      export RMW_IMPLEMENTATION=rmw_connextdds
      echo "rmw_connextdds"
      ;;
    esac
  fi
}
```

## Various Alias

### Sources

```bash
# Source .bashrc
alias sb="source $HOME/.bashrc"
# Source this workspace
alias st="source install/setup.bash; echo 'Sourcing current workspace'"
alias rrs="source /opt/ros/humble/setup.bash; echo sourcing [0]: /opt/ros/humble/setup.bash"
```

### Colcon related 

```bash
alias cb="colcon build --symlink-install --continue-on-error"
alias cbp="colcon build --symlink-install --continue-on-error --packages-select"
alias ccw="colcon clean workspace"
alias ccp="colcon clean packages --packages-select"

alias eb="$EDITOR $HOME/.bashrc"
```

