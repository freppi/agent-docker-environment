FROM node:20-slim

RUN apt-get update && apt-get install -y \
    git \
    bash \
    curl \
    openssh-client \
    ripgrep \
 && rm -rf /var/lib/apt/lists/*

RUN npm install -g \
    @anthropic-ai/claude-code \
    @openai/codex

RUN mkdir -p /workspace /tmp/codex /home/node/.cache /home/node/.local/share \
 && chown -R node:node /workspace /tmp/codex /home/node

ENV HOME=/home/node
ENV TMPDIR=/tmp/codex

WORKDIR /workspace
USER node
