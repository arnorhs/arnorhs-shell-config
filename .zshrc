local this_file_path=${0:a:h}
source $this_file_path/shell/functions.sh
source $this_file_path/shell/aliases.sh

# for modifier key + backspace behavior:
# I believe I copied it from https://stackoverflow.com/a/10860628
autoload -U select-word-style
select-word-style bash

# prompt
# from
PROMPT='%F{blue}%3~%f %# '

# this is something to do with erroring out on failed glob matches - it makes it behave like bash
setopt no_nomatch

# this is for zsh-completion brew package:
# https://formulae.brew.sh/formula/zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi


# this makes it so that if you are in a node repo, it will allow you to run the
# registered scripts from the shell without prefixing with ./node_modules/.bin
export PATH=$PATH:node_modules/.bin
