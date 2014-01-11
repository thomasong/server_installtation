#!/bin/bash
wget  http://freeware.sgi.com/source/rzsz/rzsz-3.48.tar.gz
tar zxvf  rzsz-3.48.tar.gz
cd src
# 如果不修改Makefile会出现：
# **** UNREGISTERED COPY *****
# Please read the License Agreement in rz.doc
# vim Makefile
# 只需要修改第四行的 “OFLAG= -O” 为 “OFLAG= -O -DREGISTERED”
make posix
cp rz sz /usr/bin/
