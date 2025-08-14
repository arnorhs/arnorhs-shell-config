# cant be without this
alias g='grep -iRn --exclude-dir={node_modules,.git,.next,dist} --color'

# who actually uses the defualt ls output?
alias ls='ls -laG'

alias ip='ifconfig | grep "inet "'

# Because i'm a dumbass
alias gti=git

alias amend='git commit --amend'

alias btop='btop --low-color'

alias ghpr='gh pr create --label=automerge --fill-first'
alias prview='gh pr view --web'
