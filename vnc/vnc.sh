#!/bin/bash


#rm -rf .vnc/xstartup
#rm -rf /tmp/.X23-lock && rm -rf /tmp/.X11-unix/X23
vncserver -kill :23
 
case $1 in
    "obox" )
	rm -r .vnc/xstartup
        ln -s xstartup-obox .vnc/xstartup
        ;;
    "xfce4" )
        rm -r .vnc/xstartup
        ln -s xstartup-xfce4 .vnc/xstartup
        ;;
    "fluxbox" )
        rm -r .vnc/xstartup
        ln -s xstartup-fluxbox .vnc/xstartup
        ;;
    * )
        echo "UNSUPPORTED! USING XFCE4 YOU RETARD"
        ;;
    esac

          
#unpack .vnc1
#rm -rf .vnc/xstartup
#rm -rf /tmp/.X23-lock && rm -rf /tmp/.X11-unix/X23
vncserver -depth 24 -geometry 1823x1123 :23



