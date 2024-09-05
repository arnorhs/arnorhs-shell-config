# My shell setup

I use this repo to have a similar shell experience in different computers on mac os x and for
some helpful shortcuts and commands.

*Note: this used to be mostly my vim config, but I've mostly stopped using vim for editing and it was all out of date so I just removed all that crap*

## setup

- Clone this repo into home dir as .. eg. `thisrepo`
- Sym link config files
  ```sh
  ln -s ~/thisrepo/.vimrc ~/.vimrc
  ln -s ~/thisrepo/.gitconfig ~/.gitconfig
  ```
- include shell-files from your local shell's rc file:
  ```sh
  source thisrepo/.zshrc
  ```
  or for bash:
  ```sh
  source thisrepo/.bash_profile
  ```

## overview of stuff

Note: invoking functions and aliases is the same thing, except for the behavior of aliases where
you can add extra arguments - so that's better suited for cases where you just want to augment an
existing command.

### .zshrc specifics
  - Sets the word-select and modifier key-word navigation to what I'm used to - jump between words
    with modifier keys + arrows
  - Sets the prompt to eg. `~/arnorhs-shell-config % ` in blue - im used to that.
  - Loads [zsh-completions](https://formulae.brew.sh/formula/zsh-completions) - if you have
    brew installed
  - adds `node_modules/.bin` to your `$PATH` - makes it so you can use bin scripts in node_modules
    without typing out the full path to them and without prefixing them with
    `bun`/`npm run`/`yarn`/`pnpm` etc

### aliases
  - `g` - `grep` ignoring most common things, defaults to case insensitive and recursive and
    prints the file & line number & highlights matches
  - `ls` - ls with -laG
  - `ip` - show your current local ip address - usefull because `ifconfig` gives you so many
    virtual interfaces
  - `gti` - because i'm a dumbass

### functions
  - `duf` / `dus` - reasonably readable file size summary of the current dir
  - `removecontainers` - force remove all docker containers
  - `armageddon` - remove all docker containers, images, volumes and network interfaces
  - `wip` - add & commit the current working tree and push to remote branch (errors if on
    main/master branch) - optionally supply a commit message other than "wip" (surround with
    quotes)
  - `port_kill` - tries to find a process runnin on a particular port and tries to forcefully
    kill it - port is first argument
  - `port_list` - list processes listening to a particular port - port is first argument
  - `jwtdecode` - decode first argument as a jwt token

### vimrc
  - Mostly just some sane defaults copied from a bunch of places and mostly just useful for me
    probably