set -e # exit on error
set -u # disallow unset variables usage

dir=~/.dev-setup

OPTIND=1
INSTALL_EMACS=1
while getopts "n" opt; do
    case "$opt" in
    n)
            INSTALL_EMACS=0
    esac
done

echo "Install git"
sudo apt-get -y install git

mkdir -p $dir
cd $dir

if [ $INSTALL_EMACS -eq 1 ]; then
    echo "Install Emacs 24.4"
    sudo apt-get install build-essential
    sudo apt-get build-dep emacs24
    wget http://ftp.gnu.org/gnu/emacs/emacs-24.4.tar.gz
    tar -xzvf emacs-24.4.tar.gz
    rm emacs-24.4.tar.gz
    cd emacs-24.4
    ./configure # --prefix=/opt/emacs
    make -j4
    sudo make install
    cd ..

    git clone https://github.com/snosov1/ctags-d.git
    cd ctags-d
    ./configure
    make -j4
    sudo make install
    cd ..

    # bind Caps Lock to ctrl
    echo 'remove Lock = Caps_Lock
remove Control = Control_L
keysym Caps_Lock = Control_L
add Control = Control_L' >/tmp/.xmodmap
    echo 'xmodmap ~/.xmodmap' >/tmp/.xsession
    cp -b /tmp/.xmodmap ~/.xmodmap
    cp -b /tmp/.xsession ~/.xsession
fi

# emacs config
if [ -d "dot-emacs" ]; then
    echo "Update Emacs config"
    cd dot-emacs
    git pull
    cd ..
else
    echo "Install Emacs config"
    git clone https://github.com/snosov1/dot-emacs.git
    emacs --batch --script $dir/dot-emacs/create-links.el
fi

# bash config
if [ -d "bash" ]; then
    echo "Update bash config"
    cd bash
    git pull
    cd ..
else
    echo "Install bash config"
    git clone https://github.com/snosov1/bash.git
    pushd .
    cd bash
    bash install-bashrc.bash
    popd
fi

# useful utilities
if [ -d "bin" ]; then
    cd bin
    git pull
    cd ..
else
    git clone https://github.com/snosov1/bin.git
    ln -s $dir/bin ~/bin
fi
