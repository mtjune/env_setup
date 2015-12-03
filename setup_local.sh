#!/bin/bash

# OS判別
if [ "$(uname)" == 'Darwin' ]; then
  OS='mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  if type dnf; then
    OS='redhat'
  elif type yum; then
    OS='redhat_yum'
  elif type apt-get; then
    OS='debian'
  fi
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi




# スクリプトが置いてある場所に移動
cd `dirname $0`


# Install Section
echo "### Install Section ###"

source echo "0_install/${OS}.sh"
source echo "0_install/common.sh"


# Dotfiles Section
echo "### Dotfiles Section ###"

source echo "1_dotfiles/common.sh"


# TeX Section
# echo "### TeX Section ###"
# if $OS == "mac"; then
#   source echo "2_tex/mac.sh"
# else
#   echo "tex setup only mac"
# fi

echo "### Complete! ###"

exec -l $SHELL

exit(0)
