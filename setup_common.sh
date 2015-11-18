#!/bin/sh

# 基本的にはGitが必要な環境設定

echo "### Common Section ###"

command_eval(){

  if yes | eval echo ${1}; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi
}


if type git > /dev/null 2>&1 then

  # anyenv
  echo "Install anyenv"
  command_eval "git clone https://github.com/riywo/anyenv ~/.anyenv"

  mkdir -p ~/.anyenv/plugins

  # anyenv-update
  echo "Install anyenv-update"
  command_eval "git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update"

  # anyenv-git
  echo "Install anyenv-git"
  command_eval "git clone https://github.com/znz/anyenv-git.git ~/.anyenv/plugins/anyenv-git"
fi



echo "### Dotfiles Section ###"

if type git > /dev/null 2>&1 then
  if yes | git clone https://github.com/mtjune/dotfiles ~/.dotfiles; then
    cd ~/.dotfiles
    script/setup.sh

  fi
fi
