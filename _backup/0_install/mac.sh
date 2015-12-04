#!/bin/bash


command_eval(){
  if yes | eval `${1}`; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi
}


# xcode-select --install

# Homebrewインストール
if type brew >/dev/null 2>&1; then
  echo "homebrew found!"

else
  echo "homebrew not found"
  echo "Install homebrew"
  if yes | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi
fi


# git tmux vim emacs brew-caskをインストール
BREWS=("git" "tmux" "--with-lua vim" "--with-cocoa emacs" "caskroom/cask/brew-cask" "openssl")
for app in ${BREWS[@]}
do
	command_eval "sudo brew install $app"
done

# zshをインストール，設定
command_eval "sudo brew install --disable-etcdir zsh"
sudo echo "/usr/local/bin/zsh" >> /etc/shells
sudo chsh -s /usr/local/bin/zsh


# brew-caskを使う前にPATH更新
PATH=/usr/local/bin:$PATH


# caskのやつ色々インストール
BREW_CASKS=(iterm2 atom alfred xquartz google-chrome google-japanese-ime skim karabiner qlmarkdown qlcolorcode qlstephen betterzipql quicklook-json)
for app in ${BREW_CASKS[@]}
do
	command_eval "sudo brew cask install --appdir=/Applications $app"
done
