if [[ $(id -u) -ne 0 ]] ; then echo "Please, run as sudo" ; exit 1 ; fi

dir=~/.dev-setup

apt-get -y install git

add-apt-repository ppa:cassou/emacs
apt-get update
apt-get -y install emacs24 emacs24-el emacs24-common-non-dfsg

mkdir -p $dir
cd $dir

# emacs config
git clone https://github.com/snosov1/dot-emacs.git
ln -s ~/.emacs dot-emacs/.emacs
ln -s ~/.mc-lists.el dot-emacs/.mc-lists.el
