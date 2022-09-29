## Git useful commands

1. [A quick guide to Git](#git-no-deep-shit)
2. [Clone a repository](#clone)
3. [Check repository status](#status)
4. [Push files to online repository](#push)
5. [Get files from online repository](#pull)
6. [Check and create branches](#branches)
7. [Create a GitHub repository](#create)
8. [Git difftool](#difftool)

## A quick guide to Git <a name="git-no-deep-shit"></a>

Take may want to take a look at this [guide](https://rogerdudler.github.io/git-guide/) to familiarize with Git versioning.

If you're really hungry for knowledge, here is a [500+ pages book](https://git-scm.com/book/en/v2) about Git.

### Clone a repository <a name="clone"></a>
```
git clone URL
```
### Check repository status <a name="status"></a>
```
git status
```
### Push files to online repository <a name="push"></a>
  ```
  git add -A
  git commit -m "write your comment here"
  git push
  ```
### Get files from online repository <a name="pull"></a>
You can:
* download the changes of your branch present online but not present locally:
```
git pull
```
* update the information from the online repo without downloading it (useful to see if there are any differences before doing a pull)
```
git fetch
```

### Check and create branches <a name="branches"></a>
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
* see remote url and tracked braches:
```
git remote show origin
```
* see staged files and choose if unstage them one at a time
```
git checkout -p
```
* merge branch "A_branch" to branch "B_branch":
```
git merge B_branch A_branch
```
#### Create a new branch and synchronize with remote repository
```
git checkout -b <new_branch>
git add -A
git commit -m "your message"
git push -u origin <new_branch>
```

### Create a GitHub repository <a name="create"></a>
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
  * create your files, then push to the master:
  ```
   git add -A
   git commit -m "your message"
   git push --set-upstream origin master
  ```

### Git difftool <a name="difftool"></a>

Difftool is a useful tool to visualize differences between branches/versions with a GUI. To use it:

```
sudo apt install meld
```
Copy this in your ./gitconfig file:
```
[diff]
	guitool = meld
[difftool "meld"]
	cmd = meld \"$LOCAL\" \"$REMOTE\"
[difftool]
	prompt = false
[merge]
	tool = meld
[mergetool "meld"]
	path = /usr/bin/meld
[mergetool]
	prompt = false
```

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
