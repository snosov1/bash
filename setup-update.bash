dir=~/.dev-setup

cd $dir

if [ -d "dot-emacs" ]; then
    cd dot-emacs
    git pull
    cd ..
fi

if [ -d "bash" ]; then
    cd bash
    git pull
    cd ..
fi

if [ -d "bin" ]; then
    cd bin
    git pull
    cd ..
fi

# links
emacs --batch --script $dir/dot-emacs/create-links.el
