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
