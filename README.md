# installation

Installation of the JRL-CARI Workspace can be done in a single workspace or a multiple workspaces.
The second saves you times during compilation.

## Installation on a single workspace
_see [here](installation_single_workspace.md)_


## Installation on multiple (overlayed) workspaces
_see [here](installation_multiple_workspace.md)_

# Configure QtCreator
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
* clone an online repository
```
git clone URL
```
* see repository status
```
git status
```
* to push your file to the online repository, follow these steps:
  * stage the modified files:
  ```
  git add -A
  ```
  * create a commit:
  ```
  git commit -m "write your comment here"
  ```
  * push your work to the online repository:
  ```
  git push
  ```
* download the changes of your branch present online but not present locally:
```
git pull
```
* update the information from the online repo without downloading it (useful to see if there are any differences before doing a pull)
```
git fetch
```
* see the local and remote branches
```
git branch --all
```
* change your branch
```
git checkout branch_name
```
* see commits list
```
git log
```
  with branches graph:
  ```
  git log --all --decorate --graph
  ```
* see staged files and choose if unstage them one at a time
```
git checkout -p
```
* merge branch "A_branch" to branch "B_branch":
```
git merge B_branch A_branch
```
* create a GitHub repository from scratch:
  * create the repo on GitHub and copy the URL
  * create the repo on your pc with the same name
  * go inside the repo using the terminal and type
  ```
  git init
  ```
  * associate the local repository with the online one:
  ```
  git remote add origin URL
  ```
  * create your files, commit them and then push to the master:
  ```
   git push --set-upstream origin master
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



### Bash tips

Copy these commands into your .bashrc file:
* see git branch name next to the path in the terminal

```
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
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
