FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1

RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-terminal \
    tigervnc-standalone-server \
    novnc \
    websockify \
    dbus-x11 \
    python3 \
    python3-pip \
    sudo \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.vnc && \
    printf '#!/bin/sh\nstartxfce4 &\n' > /root/.vnc/xstartup && \
    chmod +x /root/.vnc/xstartup

WORKDIR /app

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
