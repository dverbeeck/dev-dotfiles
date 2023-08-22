#!/bin/bash

git pull 
CFLAGS="-I/opt/ffmpeg-styro/include/" PKG_CONFIG_PATH=/opt/ffmpeg-styro/lib/pkgconfig ./configure && gmake clean && CFLAGS="-I/opt/ffmpeg-styro/include/" PKG_CONFIG_PATH=/opt/ffmpeg-styro/lib/pkgconfig gmake 

if [ -f "retroarch" ];
then
echo "Build Success! Moving to /usr/bin"
sudo mv retroarch /usr/bin
else
echo "Build Failed! FUCK OFF"
fi

