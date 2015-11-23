echo "### Dotfiles Section ###"

if type git then
  if yes | git clone https://github.com/mtjune/dotfiles ~/.dotfiles; then
    cd ~/.dotfiles
    script/setup.sh

  fi
fi
