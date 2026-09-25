FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Update & upgrade + install Python and pip
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        python3 \
        python3-pip \
        curl \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install sshx
RUN curl -sSf https://sshx.io/get | sh

WORKDIR /app

# Start Python HTTP server and sshx
CMD sh -c 'python3 -m http.server ${PORT:-10000} --bind 0.0.0.0 & sshx'
