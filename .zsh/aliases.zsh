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
alias start_pg="PGPASSWORD='postgres' podman run -it postgres:latest"
