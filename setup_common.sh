#!/bin/sh

# 基本的にはGitが必要な環境設定

echo "### Common Section ###"

if type git > /dev/null 2>&1 then

  # anyenv
  echo "Install anyenv"
  if yes | git clone https://github.com/riywo/anyenv ~/.anyenv; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi

  mkdir -p ~/.anyenv/plugins

  # anyenv-update
  echo "Install anyenv-update"
  if yes | git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi

  # anyenv-git
  echo "Install anyenv-git"
  if yes | git clone https://github.com/znz/anyenv-git.git ~/.anyenv/plugins/anyenv-git; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi
fi



echo "### Dotfiles Section ###"

if type git > /dev/null 2>&1 then
  if yes | git clone https://github.com/mtjune/dotfiles ~/.dotfiles; then
    cd ~/.dotfiles
    script/setup.sh

  fi
fi
