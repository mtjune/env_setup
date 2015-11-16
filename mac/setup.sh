#!/bin/bash



# install section
echo "### Installation Section ###"

# Mac OS X の場合
install_mac() {

  # まず homebrew 確認
  if type brew > /dev/null 2>&1 then
    echo "homebrew not found"
    echo "install homebrew"
    if yes | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; then
      echo "Successed !"
    else
      echo "Failed !"
    fi

  else
    echo "homebrew found !"
  fi

  echo ""

  # git
  echo "Install git"
  if yes | brew install git; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi

  echo ""

  # zsh
  echo "Install zsh"
  if yes | brew install zsh; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi

  echo ""

  # tmux
  echo "Install tmux"
  if yes | brew install tmux; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi


  echo ""

  # vim
  echo "Install vim"
  if yes | brew install vim; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi


  echo ""

  # emacs
  echo "Install emacs"
  if yes | brew install emacs; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi


  echo ""

  PATH = /usr/local/bin:$PATH

  # git が必要なインストール
  if type git > /dev/null 2>&1 then

    # anyenv
    echo "Install anyenv"
    if yes | git clone https://github.com/riywo/anyenv ~/.anyenv; then
      echo " - Successed !"
    else
      echo " - Failed !"
    fi
  fi


}


if [ "$UNAME" = "Darwin" ]; then
  # Mac OS X
  install_mac()

elif [ "$UNAME" = "Linux" ]; then
  # Linux

fi


echo "### Dotfiles Section ###"

if type git > /dev/null 2>&1 then
  if yes | git clone https://github.com/mtjune/dotfiles ~/.dotfiles; then
    cd ~/.dotfiles
    script/setup.sh

  fi
fi

# change shell to zsh
chsh -s /bin/zsh

exec -l $SHELL

echo "### Completed ! ###"
