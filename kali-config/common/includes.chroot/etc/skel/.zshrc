# Define Environment variables
export ZSH="/home/tim/.oh-my-zsh"
export PATH="$HOME/.symfony/bin:$PATH"
export VISUAL=nvim
export EDITOR="$VISUAL"
export MPD_HOST=~/.config/mpd/socket
export MPD_PORT="6600"

# Appearance
ZSH_THEME="common"

plugins=(
	symfony
	composer
	docker
	colored-man-pages
	zsh-completions
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Enable Vi-Mode
bindkey -v

# General Aliases
alias ll='ls -l'
alias la='ls -la'
alias f='ranger'
alias sf='sudo ranger'
alias v='nvim'
alias sv='sudo nvim'
alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias x='exit'

# Dev specific
alias sserve="java -jar /usr/local/bin/selenium-server-standalone-3.141.59.jar"
alias yta="youtube-dl --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s' --add-metadata"
alias ytv="youtube-dl -f best -o'%(title)s.%(ext)s'"

# Git Aliases
alias gs='git status'
alias gc='git commit -m'
alias gaa='git add --all'
alias gp='git push'
alias gl='git log'

# Enable Syntax Highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Git Autosuggestions
autoload -U compinit && compinit

# Execute Suggestions witzh CTRL+T
bindkey '^ ' autosuggest-execute

# FZF-Configuration
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
