
# for modifier key + backspace behavior:
autoload -U select-word-style
select-word-style bash

# prompt
# from
PROMPT='%F{blue}%3~%f %# '

# cant be without this
alias g='grep -iRn --exclude-dir=node_modules --color'
alias ls='ls -laG'

# from http://spf13.com/post/human-readable-du-sorted-by-size/
function duf {
  du -k "$@" | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}t${fname}"; break; fi; size=$((size/1024)); done; done
}
function dus {
  du -hs "$@" | sort -h
}

alias du1='duf --max-depth=1'
alias du2='duf --max-depth=2'
alias du0='duf --max-depth=0'

jump() {
  JUMPLOG=$HOME/.jumplog
  JUMPFAVS=$HOME/.jumpfavs

  touch $JUMPFAVS

  if [[ $1 == \-* ]]
  then
    JUMPNUM=$(echo $1 | cut -c2-)
    if [[ $JUMPNUM =~ '^[0-9]+$' ]]
    then
      JUMPNAME=$(tail -$JUMPNUM $JUMPLOG | head -n 1)
    else
      #while IFS= read -r line; do
      #  echo "$line"
      #done < $JUMPFAVS
      echo "^$JUMPNUM\s$"
      fav=$(grep -E "^$JUMPNUM\\s" $JUMPFAVS)

      echo "fav found: $fav"
      return
    fi
  else
    echo "$1" >> $JUMPLOG
    JUMPNAME=$1
  fi

  echo "jumping to '$JUMPNAME'"

  cd $HOME/projects/$JUMPNAME
}

removecontainers() {
  docker stop $(docker ps -aq)
  docker rm $(docker ps -aq)
}

armageddon() {
  removecontainers
  docker network prune -f
  docker rmi -f $(docker images --filter dangling=true -qa)
  docker volume rm $(docker volume ls --filter dangling=true -q)
  docker rmi -f $(docker images -qa)
}

wip() {
  local defmsg="wip"
  local msg=${1:-$defmsg}
  git add -A
  git commit -m"$msg"
  git push origin $(git symbolic-ref -q HEAD)
}


vsc() {
  if [[ $1 == \-* ]]
  then
      X=$1
  else
      X="."
  fi
  open $X -a 'visual studio code'
}

gatsby_kill() {
  PSAUX="$(ps)"

  while IFS= read -r line; do
    if [[ $line == *"gatsby develop"* ]]; then
      id=$(echo $line | cut -d " " -f 1)
      kill -9 $id
      echo "killed 'gatsby develop' process $id"
    fi
  done <<< "$PSAUX"
}

setopt no_nomatch

alias composer="php /usr/local/bin/composer"

# this is for zsh-completion brew package:
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# experimental
#
port_kill () {
  PORT=$1

  lsof -nP -i4TCP:$PORT | grep LISTEN | sed -n 's@[a-zA-Z]*[ ]*@@p' | sed -n 's@[ ].*@@p' | xargs kill -9
}

port_list () {
  PORT=$1

  lsof -nP -i4TCP:$PORT | grep LISTEN
}


#  things
alias serve='http-server -c-1 -g'

export PATH=$PATH:node_modules/.bin

alias ip='ifconfig | grep "inet "'
