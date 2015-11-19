#!/bin/sh


# install section
echo "### Installation Section ###"

command_eval(){
  if yes | eval echo ${1}; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi
}



# yumがあるかどうか確認
if type yum > /dev/null 2>&1 then
  echo "yum installed"
else
  echo "not found yum"
  exit(1)
fi


# git tmux vim emacsをインストール
APPS=(git tmux vim emacs zsh)
for app in ${APPS[@]}
do
	command_eval "yum -y install $app"
done

echo "/usr/local/bin/zsh" >> /etc/shells
chsh -s /usr/local/bin/zsh




./setup_common.sh


exec -l $SHELL

echo "### Completed ! ###"
