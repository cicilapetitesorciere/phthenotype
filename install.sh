#!/bin/sh

INSTALL_PATH=~/.local/bin/

#!([ -f install.sh ] && [ -f ptheno.sh]) && echo "Error: Please go to the directory that has the install script before installing" && exit

(echo "#/usr/bin/env bash" && echo PTHENODIR=$(pwd) && cat ptheno.sh) > $INSTALL_PATH/ptheno
chmod +x $INSTALL_PATH/ptheno

#echo "Success!"