dir=~/.dev-setup

cd $dir

if [ -d "dot-emacs" ]; then
    cd dot-emacs
    git pull
    cd ..
fi

if [ -d "bash" ]; then
    cd bin
    git pull
    cd ..
fi

if [ -d "bin" ]; then
    cd bin
    git pull
    cd ..
fi
