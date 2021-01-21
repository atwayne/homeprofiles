## homeprofiles
homeprofiles is a collection of configuration files that locating in your Linux home directory.  
The purpose is for those who have to work with different os/VM, to initialize a home profile in a few seconds and also update it later with a simple `git pull`.  

Obviously, it's created as a personal collection but could be used as a fork.

## You will get:
- with `.bashrc` and `.bash_aliases` you will get a decent bash configuration and some handy aliases
- with `.gitconfig` you will have some basic git configuration  
- with `.vimrc` you will have decent vim set up 

## Install
To initialize your home directory, start with the following commands.

```
## Note this will destroy your current configuration file. Make backups if necessary.
cd ~
git init .
git remote add -t \* -f origin git@github.com:atwayne/homeprofiles.git
git checkout master
```

## Customize:
- By default everything within the home directory is ignored. Until you remove it from the exclude list.  
Check .gitignore for more information.
- It's possible to keep some configuration locally instead of make everything public. For example:
    - Create file `.bash_aliases_local` for local bash aliases.
    - Create file `.gitproxy` for local git proxy settings.
