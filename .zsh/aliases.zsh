if ls --color > /dev/null 2>&1; then
    # GNU coreutil ls found
    colorflag="--color"
else
    # default macos 'ls'
    colorflag="-G"
fi

alias ls="command ls ${colorflag}"

# enable color in all greps
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# git aliases
alias gst="git status"
alias gsl="git sl"

# meson aliases
alias mb="meson compile -C"

# gpg
alias restart_gpg="killall gpg-agent && gpg-agent --daemon"

# python virtualenv
alias create-venv="$(brew --prefix python@3.10)/bin/python3 -m venv .venv"

# podman nonsense
# podman machine ssh "sudo systemctl restart chronyd"
alias podman_sync_time="podman machine ssh 'sudo systemctl restart chronyd'"
alias podman_get_date="podman machine ssh 'date'"
alias start_pg="podman run -it -e POSTGRES_PASSWORD=\"postgres\" -p 5432:5432 postgres:latest"

alias sql_dev='pgcli -D local'
alias sql_prod='pgcli -D production'

# git thingies
alias pretendprune='git checkout -q main && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do [[ $(git cherry main $(git commit-tree $(git rev-parse "$branch"^{tree}) -p $(git merge-base main $branch) -m _)) == "-"* ]] && echo "$branch is merged into main and can be deleted"; done'
alias squashprune='git checkout -q main && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base main $branch) && [[ $(git cherry main $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

# dumb helpers
rand_account() {
    tr -dc '0-9' </dev/random | head -c "$1"
}
