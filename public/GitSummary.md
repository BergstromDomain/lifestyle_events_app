Nik's Git Summary
==================================================

##  References
- [https://git-scm.com](https://git-scm.com)
- [https://github.com](https://github.com)

###  Configuring the Git Repository
```bash
git config --list
git config --global user.name "Niklas Bergstrom"
git config --global user.email "me.niklas@gmail.com"
git config --core.editor=atom
git config --color.ui=true
git config --core.repositoryformatversion=0
git config --core.filemode=true
git config --core.bare=false
git config --core.logallrefupdates=true
```

###  Initiating the Git Repository
```bash
git init
git add -A
git status
git commit -m "Initiating the application"
```


##  Generate SSH-keys for GitHub
- `bash$ ssh-keygen -t rsa -b 4096 -C "me.niklas@gmail.com"`
- `bash$ cat ~/.ssh/id_rsa.pub`


##  GitHub: Push an existing repository from command line
- `bash$ git remote add origin git@github.com:BergstromDomain/lifestyle_events_app.git
- `bash$ git push -u origin master`


##  Using Git
- `bash$ git status`
- `bash$ git add -A`
- `bash$ git commit -m "Comment"`
- `bash$ git push`

###  Working with branches
List existing branches
```bash
git branch
```
Create a new branch using the `-b` flag of the `git checkout` command
```bash
git branch -b new-branch-name
```
To merge two branches, make sure you're on the branch you want to merge into, _master_ and run the `merge` command
```bash
git checkout master
git merge new-branch-name
```
