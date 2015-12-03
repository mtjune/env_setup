#!/bin/bash

cd /tmp

if type "curl" >/dev/null 2>&1 || type "wget" >/dev/null 2>&1; then
  tarball="https://github.com/mtjune/dotfiles/archive/master.tar.gz"

  if type "curl" >/dev/null 2>&1; then
    curl -L "$tarball"

  elif type "wget" >/dev/null 2>&1; then
    wget -O - "$tarball"

  fi | tar xv -

else
    echo "curl or wget required"
    exit 1
fi

cd /tmp/env_setup-master

source setup_local.sh
