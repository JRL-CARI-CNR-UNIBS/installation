## Git useful commands

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
