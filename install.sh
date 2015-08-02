#!/bin/bash

dotfiles=(bashrc cvsignore dir_colors gitconfig profile vim vimrc)

for dotfile in ${dotfiles[@]}; do
    rm -rf ~/.$dotfile
    ln -s $PWD/$dotfile ~/.$dotfile
done

rm -rf $PWD/vim/bundle/*
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
