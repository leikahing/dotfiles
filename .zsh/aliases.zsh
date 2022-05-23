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
