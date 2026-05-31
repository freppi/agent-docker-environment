FROM node:20-alpine

RUN apk add --no-cache \
    git \
    bash \
    curl \
    openssh-client \
    ripgrep

RUN npm install -g \
    @anthropic-ai/claude-code \
    @openai/codex

WORKDIR /workspace
