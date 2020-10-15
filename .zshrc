alias ngadmin='~/Downloads/ngrok http -subdomain=karteadminmario 8020'
alias ngtrack='~/Downloads/ngrok http -subdomain=kartetrackmario 8010'

export PATH=$PATH:/Users/ishikawa/Documents/flutter/bin
export E2E_HEADLESS_CHROME_USAGE=true
export PATH=$PATH:/Users/rei.ishikawa/Library/Android/sdk/platform-tools
export PATH=$PATH:~/.gems/bin
# 追加したソフトやパッケージ用のコマンドのパスを通す
export PATH=/usr/local/bin:$PATH

# rbenvのパスを通す
eval "$(rbenv init -)"

# direnvのパス
eval "$(direnv hook bash)"

export ZSH=~/.oh-my-zsh
ZSH_THEME="candy"
plugins=(brew brew-cask cdd gem git rbenv vagrant zsh-syntax-highlighting zsh-completions)

source $ZSH/oh-my-zsh.sh

# zsh-completionsの設定
autoload -U compinit && compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

alias ls='ls -FG'
alias ll='ls -alFG'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias cat='cat -n'
alias history='fc -l'
alias dc='docker-compose'

# 文字コードの指定
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# cdなしでディレクトリ移動
setopt auto_cd

# ビープ音の停止
setopt no_beep

# ビープ音の停止(補完時)
setopt nolistbeep

# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# ヒストリ(履歴)を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# キーバインディングをemacs風にする
bindkey -d
bindkey -e

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Setup ssh-agent
if [ -f ~/.ssh-agent ]; then
    . ~/.ssh-agent
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
    ssh-agent > ~/.ssh-agent
    . ~/.ssh-agent
fi
ssh-add -l >& /dev/null || ssh-add
export PATH=$PATH:/Users/ishikawa/.nodebrew/current/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ishikawa/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ishikawa/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ishikawa/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ishikawa/google-cloud-sdk/completion.zsh.inc'; fi
source ~/Documents/mario_command/scripts/mario.sh.inc
