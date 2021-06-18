# installation

Installation of the JRL-CARI Workspace can be done in a single workspace or a multiple workspaces.
The second saves you times during compilation.

## Installation on a single workspace
_see [here](installation_single_workspace.md)_


## Installation on multiple (overlayed) workspaces
_see [here](installation_multiple_workspace.md)_

# Configure KDevelop
_see [here](qtcreator.md)_

# Configure Atom
_see [here](atom.md)_

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
### Git useful commands

* see repository status
```
git status
```
* to push your file on online repository, follow these steps:
** stage the modified files:
```
git add -A
```
** create a commit:
```
git commit -m "write your comment here"
```
** push your work on online repository:
```
git push
```
* see the local and remote branches
```
git branch --all
```
* remove a file
```
git rm file_name
```
* see commits list
```
git log
```
with branches evolution:
```
git log --all --decorate --graph
```
* unstage files one at a time
```
git checkout -p
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
