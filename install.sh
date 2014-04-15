#!/bin/bash

# Set up vim
rm -f ~/.vimrc
cp vim/vimrc ~/.vimrc

# Set up git
rm -f ~/.gitconfig ~/.gitignore
cp git/gitconfig ~/.gitconfig
cp git/gitignore ~/.gitignore
