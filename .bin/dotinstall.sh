#!/bin/bash -ue

DOTDIR="$(cd "$(dirname "$0")" && cd ../ && pwd)"

#--------------------------------------------------------------#
##          Functions                                         ##
#--------------------------------------------------------------#

function helpmsg() {
  command echo "Usage: $DOTDIR [--help | -h]" 0>&2
  command echo ""
}

function make_backup_dir() {
  command echo "backup old dotfiles..."
  if [ ! -d "$HOME/.gdotbackup" ];then
    command echo "$HOME/.gdotbackup not found. Auto Make it"
    command mkdir "$HOME/.gdotbackup"
  fi
}

function link_to_homedir() {
  if [[ "$HOME" != "$DOTDIR" ]];then
    for f in $DOTDIR/.??*; do
      [ `basename $f` == ".git" ] || [ `basename $f` == ".bin" ] && continue
      if [[ -L "$HOME/`basename $f`" ]];then #シンボリックリンクがすでにあればrm
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then #ファイルがすでにあればbackupにmv
        command mv "$HOME/`basename $f`" "$HOME/.gdotbackup"
      fi
      command ln -snf $f $HOME
    done
  else
    command echo "same install src dest"
    exit 1
  fi
}

function link_to_vscode() {
  local vscode_setting_dir=$HOME/Library/Application\ Support/Code/User

  if [[ -L "$vscode_setting_dir/settings.json" ]];then
    command rm -f "$vscode_setting_dir/settings.json"
  fi
  if [[ -e "$vscode_setting_dir/settings.json" ]];then
    command mv "$vscode_setting_dir/settings.json" "$HOME/.gdotbackup"
  fi
  command ln -snf "$DOTDIR/settings.json" "$vscode_setting_dir/settings.json"
}


#--------------------------------------------------------------#
##          Main                                              ##
#--------------------------------------------------------------#


while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

make_backup_dir
link_to_homedir
link_to_vscode
command echo ""
command echo "#####################################################"
command echo "$(basename $0) install success!!!"
command echo "#####################################################"
command echo ""
