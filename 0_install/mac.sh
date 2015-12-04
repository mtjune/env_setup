#!/bin/bash



echo " ------ Install homebrew ------"
echo "$(ruby -e '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)')"

echo "$(brew update)"


echo " ------ Install ansible ------"
echo "$(brew install ansible)"


echo "$(HOMEBREW_CASK_OPTS='--appdir=/Applications' ansible-playbook -i /tmp/env_setup-master/hosts -vv /tmp/env_setup-master/0_install/mac_playbook.yml)"
