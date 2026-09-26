FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Update system and install required packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        curl \
        git \
        python3 \
        python3-pip \
        ca-certificates \
        bash \
        sudo && \
    rm -rf /var/lib/apt/lists/*

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Working directory
WORKDIR /workspace

# Start code-server
CMD ["sh", "-c", "mkdir -p /root/.config/code-server && printf '%s\\n' 'auth: password' 'password: muin' 'cert: false' \"bind-addr: 0.0.0.0:${PORT:-10000}\" > /root/.config/code-server/config.yaml && exec code-server /workspace"]
