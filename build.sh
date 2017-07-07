#! /bin/bash

#Check that build-essential is installed
check=`dpkg -s chrpath 2>&1 | grep "is not installed"`
if [ -n "$check" ]; then
    echo "Installing chrpath"
    sudo apt install chrpath
fi
check=`dpkg -s gawk 2>&1 | grep "is not installed"`
if [ -n "$check" ]; then
    echo "Installing gawk"
    sudo apt install gawk
fi
check=`dpkg -s texinfo 2>&1 | grep "is not installed"`
if [ -n "$check" ]; then
    echo "Installing texinfo"
    sudo apt install texinfo
fi

cd poky/
ls meta*/recipes*/images/*.bb
source oe-init-build-env
# ### Shell environment set up for builds. ###
# You can now run 'bitbake <target>'
# Common targets are:
#    core-image-minimal
#    core-image-sato
#    meta-toolchain
#    meta-ide-support
cd build/
bitbake core-image-minimal


