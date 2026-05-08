# AI Agent Docker environment

## Agents installed
- Claude
- Codex

## Environment variables
Replace .env.example to .env

Set or add configs that needs to be exported to containers.

# Create folder structure
run init-script (init.sh or init.ps1)

## Build and Run
docker compose build
docker compose up -d

or first time run
docker compose up --build -d

## Enter container
docker compose exec <service> bash

(check service name with docker compose ps)

