########################################
# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors
# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
#"PROMPT="%{${fg[black]}$bg[cyan]%} [%n@%m]%{${reset_color}%} %{${fg[green]}%} <%D{%Y/%m/%d %H:%M}> %{${reset_color}%}% ~
#%# "
#PROMPT="%{${fg[magenta]}%} [%n@%m]%{${reset_color}%} %{${fg[green]}%} <%D{%Y/%m/%d %H:%M}> %{${reset_color}%}%~
#%# "
#PROMPT="%{^[[30;48;5;082m%}%{^[[38;5;001m%}[%n@%m]%{^[[0m%}"
#PROMPT="%K{24}%~ : $%K"
#PROMPT="%F{255}[%F{009}%n%F{255}@%F{011}%m%F{255}] %F{087}<%D{%Y/%m/%d %H:%M}>%{${reset_color}%}%F{208}%~%{$reset_color%}
#%# "

PROMPT="%F{255}[%F{cyan}%n%F{255}@%F{cyan}%m%F{255}] %F{cyan}<%D{%Y/%m/%d %H:%M:%S}>%{${reset_color}%}%F{255}%~%{$reset_color%}
%# "

#
#PROMPT="%{${fg[100]}$bg[cyan]%} [%n@%m]%{${reset_color}%} %{${fg[green]}%} <%D{%Y/%m/%d %H:%M}> %{${reset_color}%}% ~
#%# "
#PROMPT="%{^[[38;5;001m%}RED%{^[[0m%}"
#PROMPT="%{$fg[green]%}%m%(!.#.$) %{$reset_color%}"
#PROMPT=$&apos;%{\e[38;5;16;48;5;46m%}%m%(!.#.$)%{\e[m%} &apos;]}]}
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"
#PROMPT="%{$fg[]$bg[yellow]%}%m%(!.#.$) %{$reset_color%}"
#PROMPT=$&apos;%{\e[38;5;46m%}%m%(!.#.$)%{\e[m%} &apos;]}]}
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:default' list-colors ""
zstyle ':completion:*' completer \
      _oldlist _complete _match _ignored _approximate _prefix
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' verbose yes
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"
setopt complete_in_word
setopt glob_complete
setopt hist_expand
setopt numeric_glob_sort

# ls colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=32:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="ls -GF"
alias gls="gls --color"
zstyle ':completion:*' list-colors 'di=32' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# ヒストリファイルにコマンドラインだけではなく実行時刻と実行時間も保存
setopt extended_history

# すぐにヒストリファイルに追記
setopt inc_append_history

# コピペしやすいようにコマンド実行後は右プロンプトを消す
setopt transient_rprompt

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

# tmux
export TERM="xterm-256color"
alias tmux="tmux -2"

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi



########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh ]
# vim:set ft=zsh:

MPIROOT=/usr/local/openmpi-4.0.2
export PATH=$MPIROOT/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MPIROOT/lib
export MANPATH=$MANPATH:$MPIROOT/share/man

#export PATH=$PATH:/opt_ext/cmake/bin

#pyenv
export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(plenv init - zsh)"
#export PATH="$PYENV_ROOT/versions/anaconda3-4.3.0/bin/:$PATH"

# CUDA path
#export CUDA_ROOT="/usr/local/cuda"
#export PATH=$CUDA_ROOT/bin:$PATH
#export LIBRARY_PATH=$CUDA_ROOT/lib:$CUDA_ROOT/lib64:$LIBRARY_PATH  
#export LD_LIBRARY_PATH=$CUDA_ROOT/lib64/
