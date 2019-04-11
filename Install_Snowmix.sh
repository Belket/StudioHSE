#!/bin/bash
#sudo apt-get install virtualbox-guest-dkms
#sudo reboot
sudo apt-get install build-essential automake autoconf libtool g++ pkg-config libsdl1.2-dev libpango1.0-dev libpng12-dev libosmesa6-dev freeglut3-dev
sudo apt-get install tcl8.6 tk8.6 bwidget tcl8.6-dev
mkdir tmp
cd tmp
wget https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.6.3.tar.xz
wget https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.6.3.tar.xz
wget https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.6.3.tar.xz
wget https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.6.3.tar.xz
wget https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.6.3.tar.xz
wget https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.6.3.tar.xz
tar -xvf gstreamer-1.6.3.tar.xz
cd gstreamer-1.6.3/
sudo apt-get install autopoint
sudo apt-get install bison
sudo apt-get install flex
sudo apt-get install valgrind
sudo apt-get install gobject-introspection
sudo apt-get install docbook2ps
sudo apt-get install xsltproc
sudo apt-get install jadetex
sudo ./autogen.sh --disable-docbook --disable-gtk-doc --disable-gtk-doc-html
sudo make
sudo make install
cd ..
tar -xvf gst-plugins-base-1.6.3.tar.xz
cd gst-plugins-base-1.6.3/
sudo ./autogen.sh --disable-docbook --disable-gtk-doc --disable-gtk-doc-html
sudo make
sudo make install
cd ..
tar -xvf gst-plugins-good-1.6.3.tar.xz
cd gst-plugins-good-1.6.3
sudo ./autogen.sh --disable-docbook --disable-gtk-doc --disable-gtk-doc-html
sudo make
sudo make install
cd ..
tar -xvf gst-plugins-bad-1.6.3.tar.xz
cd gst-plugins-bad-1.6.3/
sudo ./autogen.sh --disable-docbook --disable-gtk-doc --disable-gtk-doc-html
sudo make
sudo make install
cd ..
tar -xvf gst-plugins-ugly-1.6.3.tar.xz
cd gst-plugins-ugly-1.6.3/
sudo apt-get install libx264-dev
sudo ./autogen.sh --disable-docbook --disable-gtk-doc --disable-gtk-doc-html
sudo make
sudo make install
cd ..
tar -xvf gst-libav-1.6.3.tar.xz
cd gst-libav-1.6.3/
sudo apt-get install yasm
sudo ./autogen.sh --disable-docbook --disable-gtk-doc --disable-gtk-doc-html
sudo make
sudo make install
cd ..
sudo wget https://kent.dl.sourceforge.net/project/snowmix/Snowmix-0.5.1.tar.gz
sudo tar -zxvf Snowmix-0.5.1.tar.gz
cd Snowmix-0.5.1/
sudo ./bootstrap #NO
export SNOWMIX=/usr/local/lib/Snowmix-0.5.1
sudo make
sudo make install
sudo ldconfig
