#!/bin/bash
set -e
echo "Installing dotfiles..."

DOTFILES="$HOME/dotfiles"
STAMP=$(date +%Y%m%d%H%M%S)

link() {
    local src="$DOTFILES/$1" dst="$HOME/$1"
    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
        return # already linked, nothing to do
    fi
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        mv "$dst" "$dst.backup.$STAMP"
        echo "backed up existing ~/$1 -> $1.backup.$STAMP"
    fi
    ln -s "$src" "$dst"
    echo "linked $1"
}

link .zshrc
link .p10k.zsh
link .zprofile
link .bashrc
link .gitconfig

if [ "$(uname)" = "Darwin" ]; then
    echo ""
    echo "Installing fonts..."
    mkdir -p ~/Library/Fonts
    cp "$DOTFILES"/fonts/*.ttf ~/Library/Fonts/
    command -v brew &>/dev/null && brew install --cask font-mononoki-nerd-font 2>/dev/null || true
elif command -v fc-cache &>/dev/null; then
    # Linux desktop (Cybele via NoMachine, etc.) -- headless cluster nodes
    # have no fc-cache and skip this harmlessly.
    echo ""
    echo "Installing fonts..."
    mkdir -p ~/.local/share/fonts
    cp "$DOTFILES"/fonts/*.ttf ~/.local/share/fonts/
    fc-cache -f ~/.local/share/fonts >/dev/null
fi

echo ""
echo "Done! Restart your terminal."
echo ""
echo "For Neovim setup:"
echo "git clone https://github.com/fmunguia-wulf/kickstart.nvim.git ~/.config/nvim"
