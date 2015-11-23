echo "### Dotfiles Section ###"

if type git >/dev/null 2>&1; then
  if yes | git clone https://github.com/mtjune/dotfiles ~/.dotfiles; then
    cd ~/.dotfiles
    script/setup.sh

  fi
fi
