dir=~/.dev-setup

mkdir -p $dir
cd $dir

# bash config
git clone https://github.com/snosov1/bash.git
pushd .
cd bash
bash install-bashrc.bash
popd

# useful utilities
git clone https://github.com/snosov1/bin.git
ln -s bin ~/bin
