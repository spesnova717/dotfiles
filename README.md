##vim install
````
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh

sh ./install.sh
vim hoge
:NeoBundleInstalli
````

##zsh install
````
sudo yum -y install zsh
echo $SHELL
cat /etc/shells
chsh -s /bin/zsh
````

##github SSH
````
$cd ~/.ssh
$ssh-keygen -t rsa

$ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/(username)/.ssh/id_rsa):id_git_rsa
Enter passphrase (empty for no passphrase):
Enter same passphrase again:

$cat id_git_rsa.pub
==>paste

$mv id_git_rsa id_rsa

$chmod 600 id_rsa

$ssh -T git@github.com
Enter passphrase for key '/xxxx/.ssh/id_rsa': 
Hi spesnova717! You've successfully authenticated, but GitHub does not provide shell access.
````

