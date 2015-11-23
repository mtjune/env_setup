#!/bin/sh

cd /tmp/

if type "curl" || type "wget"; then
  tarball="https://github.com/mtjune/dotfiles/archive/master.tar.gz"

  if type "curl"; then
    curl -L "$tarball"

  elif type "wget"; then
    wget -O - "$tarball"

  fi | tar xv -

else
    die "curl or wget required"
fi

cd /tmp/env_setup-master/

source setup_local.sh
