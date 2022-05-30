#!/bin/bash -x

ZSH_VERSION=5.9
NCURSES_VERSION=6.3

cd ../
mv dotfiles .dotfiles
cd .dotfiles

WORK_DIR=${PWD}
NCURSES_HOME=${PWD}/usr/local/ncurses
TMUX_HOME=${PWD}/usr/local/tmux
mkdir -p download
mkdir -p usr usr/local usr/local/ncurses
mkdir -p ${NCURSES_HOME}/${NCURSES_VERSION}/lib ${NCURSES_HOME}/${NCURSES_VERSION}/lib/pkgconfig
cd download

wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-${NCURSES_VERSION}.tar.gz
tar xvfz ncurses-${NCURSES_VERSION}.tar.gz
cd ncurses-${NCURSES_VERSION}
./configure --prefix=${NCURSES_HOME}/${NCURSES_VERSION} --with-shared --with-pkg-config-libdir=${NCURSES_HOME}/${NCURSES_VERSION}/lib/pkgconfig --enable-pc-files
make
make install

# ncurses
NCURSES_INC=${NCURSES_HOME}/${NCURSES_VERSION}/include/ncurses
export PATH=$NCURSES_INC:$PATH
export LD_LIBRARY_PATH=${NCURSES_HOME}/${NCURSES_VERSION}/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=${NCURSES_HOME}/${NCURSES_VERSION}/lib/pkgconfig:$PKG_CONFIG_PATH

<<COMMENT_OUT

cd ${WORK_DIR}/download

wget https://sourceforge.net/projects/zsh/files/zsh/${ZSH_VERSION}/zsh-${ZSH_VERSION}.tar.xz/download -O zsh-${ZSH_VERSION}.tar.xz
tar xvf zsh-${ZSH_VERSION}.tar.xz
cd zsh-${ZSH_VERSION}/
./configure --prefix=${WORK_DIR} --enable-multibyte --enable-locale
make
make install

echo "exec ${WORK_DIR}/bin/zsh" >> ~/.bashrc

ln -sf ${WORK_DIR}/.zshenv ~/.zshenv
ln -sf ${WORK_DIR}/.zshrc ~/.zshrc
ln -sf ${WORK_DIR}/.vimrc ~/.vimrc
ln -sf ${WORK_DIR}/.tmux.conf ~/.tmux.conf

cd ${WORK_DIR}/download
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh

mkdir -p ~/.vim
cd ~/.vim
mkdir colors

git clone https://github.com/tomasr/molokai

mv molokai/colors/molokai.vim ~/.vim/colors/


cd ${WORK_DIR}/download
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-bash --no-fish --key-bindings --completion --update-rc
COMMENT_OUT

TMUX_VERSION=3.2

cd ${WORK_DIR}/download
wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
tar -xvf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
mkdir -p ${TMUX_HOME}
./configure --prefix=${TMUX_HOME}
make
make install

echo "export PATH=${TMUX_HOME}/bin:$PATH" >> ~/.zshrc

#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
