#! /bin/sh

#Git
git clone -b pyro git://git.yoctoproject.org/poky.git

#Check that build-essential is installed
check=`dpkg -s xsltproc 2>&1 | grep "is not installed"`
if [ -n "$check" ]; then
    echo "Installing xsltproc"
    sudo apt install xsltproc
fi

#Doc
cd poky/documentation/
make DOC=sdk-manual
cd sdk-manual/eclipse/html/sdk-manual/
firefox index.html &

