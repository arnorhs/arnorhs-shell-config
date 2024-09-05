# My shell setup

I use this repo to have a similar shell experience in different computers on mac os x and for
some helpful shortcuts and commands.

*Note: this used to be my vim config, but I've mostly stopped using plain vim for code*
*and it was really out of date anyway - the most useful parts for me were the shell commands*
*and shortcuts, so I'm mostly maintaining those now*

## Setup

Clone this repo into home dir as .. eg. `arnorhs-shell-config` - (I'll refer to
that name for the rest of this setup guide:

```sh
git clone git@github.com:arnorhs/vimrc.git ~/arnorhs-shell-config
```

### Enabling shell defaults, shortcuts and gitconfig shortcuts
Really, these are disparate things - so you can pretty much pick and choose which of these
things you end up using:

- **zsh / bash defaults and shortcuts**
  include shell-files from your local shell's rc file:
  ```sh
  source ~/arnorhs-shell-config/.zshrc
  ```
  or for bash:
  ```sh
  source ~/arnorhs-shell-config/.bash_profile
  ```
- **gitconfig aliases and defaults**
  Use the `.gitconfig` file without changing/deleting your existing one (and thus allowing you
  to keep using your own `user.name` / `user.email` settings) - edit (or create) your
  `~/.gitconfig` file and append the following:
  ```
  [include]
    path = arnorhs-shell-config/.gitconfig
  ```
- **vim config**
  Sym link config files for .vim
  ```sh
  ln -s ~/arnorhs-shell-config/.vimrc ~/.vimrc
  ```

## Overview of stuff

### [git config](.gitconfig)
  - Really good config trust me
  - Mostly around not accidentally doing something nasty like disabling default `git push` without
    specifying a remote - this is really helpful if you are clumsy and have a lack of focus
  - Sets a default of not changing line endings for repos that have horrble CRLF endings etc
  - Some other things...

#### git aliases (many of these are copied from other places years ago...)

Note: A lot of people like to simply alias their bash commands for ie. `gci` for
`git commit` etc - i personally don't like that and prefer that my git commands are all
scoped under `git` - and if you feel like typing `git` before things, that's just a skill
issue and you should work on your typing speed (the irony is not lost on me, with the majority
of these commands relating to shortening things to type).

- Plain `git xx` shortcuts: `co` → `checkout`, `ci` => `commit`, `st` => `status`,
  `br` → `branch`
- `git hist` - prettier git history log printout - mostly useful when you have merge commits.
  most of the time I work with code that has linear history, so it's not really that useful to me
  anymore
- `git fshow` - prints out a full absolute path file listing of all the files changed in a
  particular commit/ref range - this is useful for passing into other commands and command line
  tools.
- `git brr <number>` - show the `<number>` of most recently used branches (I use this A LOT)
- `git wip` - adds everything in the working tree and commits it with the commit message "wip"
- `git todo <ref>` - finds all the things that have changed in your current branch that have a
  `TODO:`-style comment (prefixed by `//` unfortunately, so only works for things with those
  types fo comments) - When I'm working on a change, I like to add a bunch of TODOs all over the
  place to remind me of things I may forget to do - also helps with not going on tangents any
  time I see something. By default it compares to `origin/master` but you can supply the branch
  with the first argument
- `git update <ref>` - fetches and rebases the current branch on top of the provided branch.
  (the cool kids probably use `git pull --rebase` or something, but I haven't gotten around to
  getting used to that)
- `git base` - gives you the first parent commit that both the current branch and the master
  branch have - usefull for seeing changes compared to master when both have changes etc
- `git basemain` - same as `git base` but for `origin/main` - i haven't been bothed to see
  how plain git-aliases take in arguments
- `git squash <ref>` - starts interactive rebase squash against the `<ref>` - defaults to
  `origin/master`
- `git amend` - adds the working tree and commit-amends to the last commit without prompting
  for a commit message, also sets the date to now.

### [.zshrc specifics](.zshrc)
  - Sets the word-select and modifier key-word navigation to what I'm used to - jump between words
    with modifier keys + arrows
  - Sets the prompt to eg. `~/arnorhs-shell-config % ` in blue - im used to that.
  - Loads [zsh-completions](https://formulae.brew.sh/formula/zsh-completions) - if you have
    brew installed
  - adds `node_modules/.bin` to your `$PATH` - makes it so you can use bin scripts in node_modules
    without typing out the full path to them and without prefixing them with
    `bun`/`npm run`/`yarn`/`pnpm` etc

### [aliases](shell/aliases.sh)

Note: invoking functions and aliases is mostly the same thing, except for the behavior
of aliases where you are still running the same command as something else, so you can generally
append extra arguments etc - so that's better suited for cases where you just want to augment
an existing command with some defaults.

And these defaults are pretty conservative for the most part - I hardly ever have to reach out
for a normal `grep` for instance.

- `g` - `grep` ignoring most common things, defaults to case insensitive and recursive and
  prints the file & line number & highlights matches
- `ls` - ls with -laG
- `ip` - show your current local ip address - usefull because `ifconfig` gives you so many
  virtual interfaces
- `gti` - because i'm a dumbass

### [functions](shell/functions.sh)

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

### [vimrc](.vimrc)

If you really want to use vim, you should be using [neovim](https://neovim.io/) anyways.

The config is mostly just some sane defaults copied from a bunch of places.
