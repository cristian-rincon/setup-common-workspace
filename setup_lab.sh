#!/bin/bash

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


# Function to verify if oh-my-zsh is installed and if not, install it
function install_oh_my_zsh() {
    if [ -z "$(which zsh)" ]; then
        echo "oh-my-zsh is not installed. Installing oh-my-zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
}


# Function to install oh-my-zsh plugins
function install_oh_my_zsh_plugins() {
    echo "Installing oh-my-zsh plugins..."
    apt install zsh-autosuggestions -y
    echo "Installing zsh-syntax-highlighting..."
    apt install zsh-syntax-highlighting -y
}


# Function to verify if neovim is installed and if not, install it
function install_neovim() {
    if [ -z "$(which nvim)" ]; then
        echo "neovim is not installed. Installing neovim..."
        apt install neovim -y
        echo "Installing nerd-fonts..."
        git clone https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts && ~/nerd-fonts/install.sh
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


