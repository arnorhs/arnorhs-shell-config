#This is my .vimrc and the plugins I use

I keep the source repository in ~/.vim and remove the default .vimrc if it's in ~/.vimrc

Then I create a symbolic link:

```sh
$ ln -s ~/.vim/vimrc ~/.vimrc
$ ln -s ~/.vim/gitconfig ~/.gitconfig
```

If you want to use this, you'll also want to insta/update the plugins that are set up as
submodules, so:

```sh
$ git submodule init
$ git submodule update
```

Go crazy
