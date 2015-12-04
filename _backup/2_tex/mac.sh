#!/bin/sh


command_eval(){
  if yes | eval echo ${1}; then
    echo " - Successed !"
  else
    echo " - Failed !"
  fi
}


command_eval "brew cask install basictex"

command_eval "tlmgr update --self --all"
command_eval "tlmgr install collection-langjapanese"

cd /usr/local/texlive/2015/texmf-dist/scripts/cjk-gs-integrate
command_eval "perl cjk-gs-integrate.pl --link-texmf --force"
command_eval "mktexlsr"

command_eval "updmap-sys --setoption kanjiEmbed hiragino-elcapitan"
command_eval "updmap-sys --setoption kanjiEmbed hiragino-elcapitan-pron"

cd `dirname $0`
