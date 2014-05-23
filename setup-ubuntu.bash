dir=~/.dev-setup

OPTIND=1
INSTALL_EMACS=1
while getopts "n" opt; do
    case "$opt" in
    n)
            INSTALL_EMACS=0
    esac
done

sudo apt-get -y install git

if [ $INSTALL_EMACS -eq 1 ]; then
    sudo add-apt-repository -y ppa:cassou/emacs
    sudo apt-get update
    sudo apt-get -y install emacs24 emacs24-el emacs24-common-non-dfsg
fi

mkdir -p $dir
cd $dir

# emacs config
git clone https://github.com/snosov1/dot-emacs.git
ln -s $dir/dot-emacs/.emacs ~/.emacs
ln -s $dir/dot-emacs/.mc-lists.el ~/.mc-lists.el
ln -s $dir/dot-emacs/.abbrev_defs ~/.abbrev_defs

# bash config
git clone https://github.com/snosov1/bash.git
pushd .
cd bash
bash install-bashrc.bash
popd

# useful utilities
git clone https://github.com/snosov1/bin.git
ln -s $dir/bin ~/bin

# bind Caps Lock to ctrl
echo 'remove Lock = Caps_Lock
remove Control = Control_L
keysym Caps_Lock = Control_L
add Control = Control_L' >/tmp/.xmodmap
echo 'xmodmap ~/.xmodmap' >/tmp/.xsession
cp -b /tmp/.xmodmap ~/.xmodmap
cp -b /tmp/.xsession ~/.xsession
