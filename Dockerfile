FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        python3 \
        python3-pip \
        curl \
        ca-certificates \
        bash && \
    rm -rf /var/lib/apt/lists/*

# Install ttyd
RUN curl -L https://github.com/tsl0922/ttyd/releases/latest/download/ttyd.x86_64 \
    -o /usr/local/bin/ttyd && \
    chmod +x /usr/local/bin/ttyd

WORKDIR /app

CMD ["sh", "-c", "exec ttyd --writable -p ${PORT:-10000} /bin/bash"]
