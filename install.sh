#!/bin/bash

# Set up bash
rm -f ~/.bashrc
cp bash/bashrc ~/.bashrc

# Set up vim
rm -rf ~/.vimrc ~/.vim
cp vim/vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle
sudo apt-get -qq install curl --yes
curl -Sso ~/.vim/autoload/pathogen.vim \
	https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Set up git
rm -f ~/.gitconfig ~/.gitignore
cp git/gitconfig ~/.gitconfig
cp git/gitignore ~/.gitignore
