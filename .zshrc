export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# tell the fzf plugin where Homebrew installed it
export FZF_BASE=$(brew --prefix fzf)

# tell kubectl edit to use code
export KUBE_EDITOR="code --wait"

plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  fzf 
  macos 
  extract
)

source $ZSH/oh-my-zsh.sh

# node version manager
eval "$(fnm env --use-on-cd --shell zsh)"
export PATH="$PATH:$(npm config get prefix)/bin"

# NODE_OPTIONS
export NODE_OPTIONS="--max-old-space-size=16384"

# homebrew: M-series pathing
eval "$(/opt/homebrew/bin/brew shellenv)"

# v2rayA Proxy Helpers ---
alias proxy-status="brew services info v2raya"
proxy_on() {
    export http_proxy="http://127.0.0.1:20171"
    export https_proxy="http://127.0.0.1:20171"
    export ALL_PROXY="socks5://127.0.0.1:20170"
    echo "Terminal Proxy: ON (v2rayA)"
}
proxy_off() {
    unset http_proxy https_proxy ALL_PROXY
    echo "Terminal Proxy: OFF"
}


# alias
alias ls="eza --icons --git"
alias ll="eza -lh --icons --git"
alias la="eza -a --icons --git"
alias cat="bat"
alias cd="z" # zoxide 'smart' jump
alias tree="eza --tree"
alias grep="rg"

# starship (terminal)
eval "$(starship init zsh)"
# zoxide, replacement of `cd`
eval "$(zoxide init zsh)"