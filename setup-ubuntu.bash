dir=~/.dev-setup

apt-get install git

add-apt-repository ppa:cassou/emacs
apt-get update
apt-get install emacs24 emacs24-el emacs24-common-non-dfsg

mkdir -p $dir

cd $dir
