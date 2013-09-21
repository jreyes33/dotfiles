# My Configuration Files

I keep my config files here. Feel free to take a look around.

## Installation

The first time the repo is cloned, initialize its submodules by running:

- `git submodule init`
- `git submodule update`

Later, to update the submodules run:

- `git submodule foreach git pull origin master`

Remember to symlink the config files and directories:

- `ln -s ~/.dotfiles/vim ~/.vim`
- `ln -s ~/.dotfiles/vim/vimrc ~/.vimrc`
- and so on...
