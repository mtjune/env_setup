#!/bin/sh

cd /tmp/

if has "curl" || has "wget"; then
    tarball="https://github.com/mtjune/dotfiles/archive/master.tar.gz"

    if has "curl"; then
        curl -L "$tarball"

    elif has "wget"; then
        wget -O - "$tarball"

    fi | tar xv -

else
    die "curl or wget required"
fi

cd /tmp/env_setup-master/

source setup_local.sh
