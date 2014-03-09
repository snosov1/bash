dir=~/.dev-setup

sudo apt-get -y install git

sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get -y install emacs24 emacs24-el emacs24-common-non-dfsg

mkdir -p $dir
cd $dir

# emacs config
git clone https://github.com/snosov1/dot-emacs.git
ln -s $dir/dot-emacs/.emacs ~/.emacs
ln -s $dir/dot-emacs/.mc-lists.el ~/.mc-lists.el

# bash config
git clone https://github.com/snosov1/bash.git
pushd .
cd bash
bash install-bashrc.bash
popd

# useful utilities
git clone https://github.com/snosov1/bin.git
ln -s $dir/bin ~/bin
