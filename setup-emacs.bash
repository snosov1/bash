dir=~/.dev-setup

sudo apt-get -y install git

sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get -y install emacs24 emacs24-el emacs24-common-non-dfsg

mkdir -p $dir
cd $dir

# emacs config
git clone https://github.com/snosov1/dot-emacs.git
ln -s dot-emacs/.emacs ~/.emacs
ln -s dot-emacs/.mc-lists.el ~/.mc-lists.el
