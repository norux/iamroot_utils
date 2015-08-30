#!/bin/bash

BASEDIR=$(dirname $0)
PLUGIN_PATH=$HOME/.vim/plugin


# copy plugin to ~/.vim/plugin
mkdir -p $PLUGIN_PATH
cp $BASEDIR/plugin/iamroot_comment.vim $PLUGIN_PATH


# 기존의 vimrc 파일을 백업한다.
mkdir -p backup
DATE=`date +%Y%m%d_%H%M%S`
cp ~/.vimrc backup/vimrc.back.$DATE

# copy .vimrc to ~/.vimrc
cp vimrc ~/.vimrc
