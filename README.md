# My Configuration Files

I keep my config files here. Feel free to take a look around.

## Installation

The first time the repo is cloned (or when new Vim plugins are installed), initialize its submodules by running:

- `git submodule update --init --recursive`

Remember to symlink the config files and directories:

- `ln -s ~/.dotfiles/vim ~/.vim`
- `ln -s ~/.dotfiles/vim/vimrc ~/.vimrc`
- and so on...

## Managing vim plugins

Install:
```sh
git submodule add https://github.com/dense-analysis/ale.git vim/pack/plugins/start/ale
```

Update:
```sh
git submodule foreach git pull origin master
```

Remove:
```sh
git submodule deinit -f vim/pack/plugins/start/syntastic
git rm vim/pack/plugins/start/syntastic
rm -rf .git/modules/vim/pack/plugins/start/syntastic
```
