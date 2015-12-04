#!/bin/bash



echo " ------ Install homebrew ------"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update


echo " ------ Install ansible ------"
brew install ansible


HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook -i /tmp/env_setup-master/hosts -vv /tmp/env_setup-master/0_install/mac_playbook.yml
