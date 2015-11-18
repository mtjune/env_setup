#!/bin/bash



# install section
echo "### Installation Section ###"

# Mac OS X の場合
install_mac() {

  # まず homebrew 確認
  if type brew > /dev/null 2>&1 then
    echo "homebrew not found"
    echo "Install homebrew"
    if yes | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; then
      echo " - Successed !"
    else
      echo " - Failed !"
    fi

  else
    echo "homebrew found !"
  fi

  echo "Install brew-Cask"
  if yes | brew install caskroom/cask/brew-cask; then
    echo " - Successed !"
  else
    echo " - Failed !"


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
  if yes | brew install --disable-etcdir zsh; then
    echo "/usr/local/bin/zsh" >> /etc/shells
    chsh -s /usr/local/bin/zsh

    echo " - Successed !"
  else
    echo " - Failed !"
  fi

  echo "Install zsh-completions"
  if yes | brew install zsh-completions; then
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


  # brewでインストールしたものを使う前にPATHを更新
  PATH = /usr/local/bin:$PATH

  echo "Install Atom"
  if yes | brew cask install atom; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi

  echo ""



  # git が必要なインストール
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


}


if [ "$UNAME" = "Darwin" ]; then
  # Mac OS X
  install_mac()

else
  echo "not Mac"
  exit(1)
fi


./setup_common.sh


exec -l $SHELL

echo "### Completed ! ###"
