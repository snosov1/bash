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
if [ ! -f ~/.emacs ]; then
    ln -s $dir/dot-emacs/.emacs ~/.emacs
fi

if [ ! -f ~/.mc-lists.el ]; then
    ln -s $dir/dot-emacs/.mc-lists.el ~/.mc-lists.el
fi

if [ ! -f ~/.abbrev_defs ]; then
    ln -s $dir/dot-emacs/.abbrev_defs ~/.abbrev_defs
fi

if [ ! -d ~/.yasnippets ]; then
    ln -s $dir/dot-emacs/.yasnippets ~/.yasnippets
fi
