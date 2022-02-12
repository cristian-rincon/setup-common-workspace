#!/bin/bash
#
# Purpose:
#   This script is used to setup the lab environment.
#
# Author:
#   Cristian Rincón <github.com/cristian-rincon>
#
# Version:
#   0.1
#

# Function to update the system
function update_system() {
    echo "Updating the system..."
    apt update
    apt upgrade -y
}


# Function to verify if zsh is installed and if not, install it
function install_zsh() {
    if [ -z "$(which zsh)" ]; then
        echo "zsh is not installed. Installing zsh..."
        apt install zsh -y
        $(pwd)/1_setup_zsh.sh
        $(pwd)/2_setup_zsh_plugins.sh
    fi
}


# Function to verify if git is installed and if not, install it
function install_git() {
    if [ -z "$(which git)" ]; then
        echo "git is not installed. Installing git..."
        apt install git -y
    fi
}


# Function to verify if curl is installed and if not, install it
function install_curl() {
    if [ -z "$(which curl)" ]; then
        echo "curl is not installed. Installing curl..."
        apt install curl -y
    fi
}


# Function to verify if neovim is installed and if not, install it
function install_neovim() {
    if [ -z "$(which nvim)" ]; then
        echo "neovim is not installed. Installing neovim..."
        apt install neovim -y
        echo "Installing nerd-fonts..."
        git clone https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts && ~/nerd-fonts/install.sh
        echo "Installing vim-plug..."
        curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        echo "Installing neovim plugins..."
        git clone https://github.com/cristian-rincon/neovim-like-vscode.git ~/.config/nvim
        echo "Now you need to install the plugins by opening nvim and running :PlugInstall"
        nvim +PlugInstall +qall
    fi
}


# Function to verify if tmux is installed and if not, install it
function install_tmux() {
    if [ -z "$(which tmux)" ]; then
        echo "tmux is not installed. Installing tmux..."
        apt install tmux -y
    fi
}


# Function to run the setup
function run_setup() {
    echo "Running setup..."
    update_system
    install_zsh
    install_git
    install_curl
    install_neovim
    install_tmux
    echo "All done!, please restart your terminal to apply the changes"
}

run_setup

