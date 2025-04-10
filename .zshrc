function zcompile-many() {
    local f
    for f; do zcompile -R -- "$f".zwc "$f"; done
}

plugin_dir="${HOME}/.zsh"

if [[ ! -e ${plugin_dir}/zsh-syntax-highlighting/COMPILED ]]; then
    zcompile-many ${plugin_dir}/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}
    touch ${plugin_dir}/zsh-syntax-highlighting/COMPILED
fi

if  [[ ! -e ${plugin_dir}/zsh-autosuggestions/COMPILED ]]; then
    zcompile-many ${plugin_dir}/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
    touch ${plugin_dir}/zsh-autosuggestions/COMPILED
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ${plugin_dir}rc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

setopt autocd

setopt NO_HUP # don't HUP backgrounded things if I kill the parent shell
setopt NO_BG_NICE # don't nice background jobs
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS

setopt PROMPT_SUBST

setopt INC_APPEND_HISTORY # immediately add to history
setopt HIST_FIND_NO_DUPS # skip duped history commands
setopt HIST_IGNORE_ALL_DUPS # don't write duplicates to hist
setopt EXTENDED_HISTORY # timestamped history

bindkey -v

export EDITOR=vim
export VISUAL=${EDITOR}
export PAGER=less

if type brew &> /dev/null; then
  local brew_prefix="$(brew --prefix)"
  export PATH="${brew_prefix}/opt/coreutils/libexec/gnubin:${PATH}"
  export PATH="${brew_prefix}/opt/findutils/libexec/gnubin:${PATH}"
  export PATH="${brew_prefix}/opt/grep/libexec/gnubin:${PATH}"
  export PATH="${brew_prefix}/opt/gnu-sed/libexec/gnubin:${PATH}"

  # enable brew's zsh completions - this needs to go before compinit
  FPATH="${brew_prefix}/share/zsh/site-functions:${FPATH}"
  unset brew_prefix
fi

if type asdf &> /dev/null; then
  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:${PATH}"
fi


autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# load plugins
source ${plugin_dir}/powerlevel10k/powerlevel10k.zsh-theme
source ${plugin_dir}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${plugin_dir}/zsh-autosuggestions/zsh-autosuggestions.zsh

# load my custom aliases
source ${plugin_dir}/aliases.zsh
source ${plugin_dir}/erlang.zsh

# load fzf
source <(fzf --zsh)

unfunction zcompile-many
unset plugin_dir

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
