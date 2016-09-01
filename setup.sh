#!/bin/bash

ln -s ~/Configurations/dotfile/bashrc ~/.bashrc 
ln -s ~/Configurations/dotfile/vimrc ~/.vimrc
ln -s ~/Configurations/dotfile/emacs.el ~/.emacs
ln -s ~/Configurations/vim ~/.vim

# Setting up git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
