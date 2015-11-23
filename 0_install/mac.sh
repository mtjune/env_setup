#!/bin/sh


command_eval(){
  if yes | eval echo ${1}; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi
}


xcode-select --install

# Homebrewインストール
if ! type brew; then
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


# git tmux vim emacs brew-caskをインストール
BREWS=(git tmux vim emacs caskroom/cask/brew-cask)
for app in ${BREWS[@]}
do
	command_eval "brew install $app"
done

# zshをインストール，設定
command_eval "brew install --disable-etcdir zsh"
echo "/usr/local/bin/zsh" >> /etc/shells
chsh -s /usr/local/bin/zsh


# brew-caskを使う前にPATH更新
PATH = /usr/local/bin:$PATH


# caskのやつ色々インストール
BREW_CASKS=(iterm2 atom alfred xquartz google-chrome google-japanese-ime skim karabiner qlmarkdown qlcolorcode qlstephen betterzipql quicklook-json)
for app in ${BREW_CASKS[@]}
do
	command_eval "brew cask install $app"
done
