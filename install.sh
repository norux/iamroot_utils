#!/bin/bash

BASEDIR=$(dirname $0)
PLUGIN_PATH=$HOME/.vim/plugin


# copy plugin to ~/.vim/plugin
mkdir -p $PLUGIN_PATH
cp $BASEDIR/iamroot_comment.vim $PLUGIN_PATH


# for key mapping (add lines to ~/.vimrc)
echo "map <F5> <esc>:call IC_AnalyzingCode() <cr>" >> $HOME/.vimrc
echo "map <F6> <esc>:call IC_DailySummary() <cr>" >> $HOME/.vimrc
echo "map <F7> <esc>:call IC_FileSummary() <cr>" >> $HOME/.vimrc
