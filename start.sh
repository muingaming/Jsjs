#!/bin/bash

set -e

export DISPLAY=:1

rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1

vncserver :1 \
    -geometry 1280x720 \
    -depth 24 \
    -localhost no

websockify \
    --web=/usr/share/novnc \
    0.0.0.0:${PORT:-10000} \
    localhost:5901
