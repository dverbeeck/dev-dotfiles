#!/bin/bash

INPUTFILE=$1
head -n-2 $1 | awk '{print $1}'|grep -v Ending|grep -v Interface|grep -v Starting|uniq -u|sort

