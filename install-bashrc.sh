#!/bin/bash

cat sourcerc.sh | sed "s|\$PWD|$PWD|" >/tmp/.tmpsourcercsergei

if [ -f ~/.bashrc ]; then
    cat /tmp/.tmpsourcercsergei ~/.bashrc >/tmp/.tmpbashrcsergei
    mv /tmp/.tmpbashrcsergei ~/.bashrc
else
    mv /tmp/.tmpsourcercsergei ~/.bashrc
fi
