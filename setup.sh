#!/bin/bash

# set up symbolic links to the dotfiles folder for...

##################################################################
# vim ############################################################
rm -f ~/.vimrc && ln -s ~/dotfiles/vim/vimrc ~/.vimrc
rm -f ~/.vim && ln -s ~/dotfiles/vim/vim ~/.vim

mkdir ~/.vim/backup
mkdir ~/.vim/tmp
mkdir ~/.vim/autoload

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# cd ~/.vim/bundle
# git clone git@github.com:gmarik/Vundle.vim.git vundle

vim +PlugUpdate +qall

##################################################################



##################################################################
# tmux ###########################################################
rm -f ~/.tmux.conf && ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
rm -f ~/.tmux && ln -s ~/dotfiles/tmux/tmux ~/.tmux

##################################################################

