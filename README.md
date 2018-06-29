##New tmux install
````
https://qiita.com/trisland/items/29f81b14fc350287bfd1

If centos6
$ yum install libevent2-devel
$ yum install ncurses-devel

If centos7
$ yum install libevent-devel
$ yum install ncurses-devel

common
$ cd /usr/local/src
$ wget https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz
$ tar -xvf tmux-2.7.tar.gz
$ cd tmux-2.7

$ ./configure && make
$ make install

````
##tmux tpm install
````
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
Put this at the bottom of .tmux.conf:

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

$ tmux source ~/.tmux.conf

Reference URL
https://github.com/tmux-plugins/tpm
````


##vim install
````
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh

sh ./install.sh
vim hoge
:NeoBundleInstall
````
##vim color scheme
````
$ mkdir ~/.vim
$ cd ~/.vim
$ mkdir colors

$ git clone https://github.com/tomasr/molokai

$ mv molokai/colors/molokai.vim ~/.vim/colors/

$ vim ~/.vimrc
syntax on
colorscheme molokai
set t_Co=256

````

##zsh install
````
sudo yum -y install zsh
echo $SHELL
cat /etc/shells
chsh -s /bin/zsh
````
##fzf
````
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
````

##github SSH
````
$cd ~/.ssh
$ssh-keygen -t rsa

$ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/(username)/.ssh/id_rsa):id_git_rsa
Enter passphrase (empty for no passphrase):none
Enter same passphrase again:

$cat id_git_rsa.pub
==>paste

$mv id_git_rsa id_rsa

$chmod 600 id_rsa

$ssh -T git@github.com
Enter passphrase for key '/xxxx/.ssh/id_rsa': 
Hi spesnova717! You've successfully authenticated, but GitHub does not provide shell access.
````

##github sample command
````
git add .
git commit -m "try commit"
git push
URL:https://qiita.com/nt_tn/items/c5ea999a2638e03ee418
````

##username password
````
$vim ~/.netrc
machine github.com
login username
password xxxxxxx
````
