# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

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

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/aliases.zsh

export EDITOR=vim
export VISUAL=${EDITOR}
export PAGER=less

command -v brew > /dev/null && export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
