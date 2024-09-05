
# from http://spf13.com/post/human-readable-du-sorted-by-size/
function duf {
  echo "Remember to use with --max-detph=0, 1, 2, etc."
  du -k "$@" | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}t${fname}"; break; fi; size=$((size/1024)); done; done
}

function dus {
  du -hs "$@" | sort -h
}

function removecontainers() {
  docker stop $(docker ps -aq)
  docker rm $(docker ps -aq)
}

function armageddon() {
  removecontainers
  docker network prune -f
  docker rmi -f $(docker images --filter dangling=true -qa)
  docker volume rm $(docker volume ls --filter dangling=true -q)
  docker rmi -f $(docker images -qa)
}

wip() {
  local defmsg="wip"
  local msg=${1:-$defmsg}
  local branch=$(git rev-parse --abbrev-ref HEAD)
  if [[ $branch == "master" || $branch == "main" ]]
  then
    >&2 echo "You are on the main branch. It is ill advised to be so careless."
    return
  fi

  echo "Committing everything and pushing to origin/$branch..."

  if [[ $SHELL == */zsh ]]
  then
    read -k 1 -q "REPLY?Are you sure? (y/n): "
  else
    echo "Are you sure? (y/n): "
    read -p -n 1 -r REPLY
  fi

  # for newline after the response
  echo ""

  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    git add -A
    git commit -m"$msg"
    git push origin $branch
  fi
}

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

jwtdecode() {
  sed 's/\./\n/g' <<< $(cut -d. -f1,2 <<< $1) | base64 --decode
}
