#!/bin/sh


command_eval(){
  if yes | eval echo ${1}; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi
}


# git tmux vim emacsをインストール
APPS=(git tmux vim emacs zsh)
for app in ${APPS[@]}
do
	command_eval "dnf -y install $app"
done

echo "/usr/local/bin/zsh" >> /etc/shells
chsh -s /usr/local/bin/zsh
