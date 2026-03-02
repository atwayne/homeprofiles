#!/bin/bash

# --- 1. Check/Install Homebrew ---
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add brew to path for the current session (Apple Silicon path)
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew already installed. Updating..."
    brew update
fi

# --- 2. Install CLI Formulae ---
echo "Installing CLI utilities..."

# Grouped for efficiency
FORMULAE=(
    bat
    ca-certificates
    eza
    fnm
    fzf
    git-lfs
    htop
    jq
    kubectx
    kubernetes-cli
    libgit2
    libssh2
    ncurses
    oniguruma
    openssl@3
    pcre2
    ripgrep
    starship
    v2ray
    v2raya
    zoxide
)

for formula in "${FORMULAE[@]}"; do
    if brew list "$formula" &>/dev/null; then
        echo "✔ $formula is already installed."
    else
        echo "Installing $formula..."
        brew install "$formula"
    fi
done

# --- 3. Install Casks (GUI Apps) ---
echo "Installing GUI applications..."

CASKS=(
    cursor
    font-hack-nerd-font
    font-jetbrains-mono-nerd-font
    google-chrome
    linearmouse
    maccy
    microsoft-edge
    orbstack
    rectangle
    visual-studio-code
)

# Required to find the Nerd Fonts
brew tap homebrew/cask-fonts 2>/dev/null

for cask in "${CASKS[@]}"; do
    if brew list --cask "$cask" &>/dev/null; then
        echo "✔ $cask is already installed."
    else
        echo "Installing $cask..."
        brew install --cask "$cask"
    fi
done

# --- 4. Post-Install Configurations ---

# Initialize Git LFS globally
git lfs install

# Setup fzf key bindings and fuzzy completion
$(brew --prefix)/opt/fzf/install --all

echo "--------------------------------------------------"
echo "Bootstrap complete! Everything is installed."
echo "--------------------------------------------------"