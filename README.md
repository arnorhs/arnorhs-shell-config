# This is my .vimrc and the plugins I use (also bash stuff)

## setup

I keep the source repository in ~/.vim and remove the default .vimrc if it's in ~/.vimrc

Then I create a symbolic link for the git config:

```sh
-$ ln -s ~/.vim/vimrc ~/.vimrc
 $ ln -s ~/.vim/gitconfig ~/.gitconfig
```

And source the appropriate bash / zsh startup scripts -- edit .zshrc or .bash_profile
and add the following:

```sh
source .vimrc/.zshrc

## submodules

If you want to use this, you'll also want to insta/update the plugins that are set up as
submodules, so:

```sh
$ cd .vim
$ git submodule init
$ git submodule update
```

Go crazy
