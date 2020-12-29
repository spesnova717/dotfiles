cd dotfiles
mkdir download
cd download
wget https://sourceforge.net/projects/zsh/files/zsh/5.8/zsh-5.8.tar.xz/download -O zsh-5.8.tar.xz
tar xvf zsh-5.8.tar.xz
cd zsh-5.8/
./configure --prefix=$HOME/dotfiles --enable-multibyte --enable-locale
make
make install

echo "exec $HOME/dotfiles/bin/zsh" >> ~/.bashrc

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

cd ../../

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh

sh ./install.sh

cd ~/.vim
mkdir colors

git clone https://github.com/tomasr/molokai

mv molokai/colors/molokai.vim ~/.vim/colors/

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
