sudo yum install libevent-devel
sudo yum install ncurses-devel
mkdir download
cd download
wget https://sourceforge.net/projects/zsh/files/zsh/5.8/zsh-5.8.tar.xz/download -O zsh-5.8.tar.xz
tar xvf zsh-5.8.tar.xz
cd zsh-5.8/
./configure --enable-multibyte --enable-locale
make
make install
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh
cd
git clone  https://github.com/spesnova717/dotfiles.git
sh ./inst.sh
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
mkdir ~/.vim
cd ~/.vim
mkdir colors
git clone https://github.com/tomasr/molokai
mv molokai/colors/molokai.vim ~/.vim/colors/
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
