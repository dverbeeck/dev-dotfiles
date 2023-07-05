#!/bin/bash

files=(/home/nixon/images/wallpapers/*)

randomfile=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")
echo $randomfile
fbsetbg -f $randomfile
