#!/bin/bash
## init
base_dir=$(cd $(dirname $0) && pwd)
base_file=$(basename $0)
find "${base_dir}" -type f -name ".DS_Store" | xargs rm

## backup
if [ ! -d "${base_dir}/tmp" ]; then
  mkdir "${base_dir}/tmp"
fi
backup_timestamp=$(date +'%Y%m%d_%H%M%S')
backup_dir="${base_dir}/tmp/${backup_timestamp}"
mkdir "${backup_dir}"


## tmux
if [ -L ~/.tmux.conf ]; then
  rm ~/.tmux.conf
fi
ln -s "${base_dir}/tmux/tmux.conf" ~/.tmux.conf


## git
if [ -L ~/.gitconfig ]; then
  rm ~/.gitconfig
fi
ln -s "${base_dir}/gitconfig/gitconfig.txt" ~/.gitconfig


## zsh
if [ -L ~/.zshrc ]; then
  rm ~/.zshrc
fi
ln -s "${base_dir}/zsh/zshrc.txt" ~/.zshrc

if [ -L ~/.zshrc_personal ]; then
  rm ~/.zshrc_personal
fi
ln -s "${base_dir}/zsh/zshrc_personal.txt" ~/.zshrc_personal


## vim
if [ -L ~/.vimrc ]; then
  rm ~/.vimrc
fi
ln -s "${base_dir}/vim/vimrc.txt" ~/.vimrc
