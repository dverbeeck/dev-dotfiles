#!/bin/bash

FLAGS="-I/opt/ffmpeg-styro/include/" PKG_CONFIG_PATH=/opt/ffmpeg-styro/lib/pkgconfig ./configure && gmake clean && CFLAGS="-I/opt/ffmpeg-styro/include/" PKG_CONFIG_PATH=/opt/ffmpeg-styro/lib/pkgconfig gmake 

sudo mv retroarch /usr/bin/
