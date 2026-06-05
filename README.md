# Dev Container Setup

This workspace uses two Docker services with separate responsibilities:

- `specs`: for writing specifications and notes
- `dev`: for implementation, builds, tests, and code changes

The goal is to keep the workflow practical while reducing unnecessary container privileges.

## Services

### `specs`

Use `specs` when you want the agent to:

- write or update files in `specs/`
- write notes in `notes/`
- read the application source in `repo/`

This container can read the repository, but it cannot modify it.

### `dev`

Use `dev` when you want the agent to:

- change code in the workspace
- run React and .NET development tasks
- install project dependencies
- build and test against the current specs

## Security Model

Both containers are configured to be safer than a default dev container:

- run as non-root user `node`
- `read_only: true` for the container filesystem
- `cap_drop: [ALL]`
- `no-new-privileges:true`
- writable access only where needed
- writable temp/cache paths mounted separately

The `dev` container has broader write access because it is the execution container. The `specs` container is intentionally more restricted.

## Dockerfiles

Expected Dockerfile paths:

- `dockerfiles/Dockerfile.dev`
- `dockerfiles/Dockerfile.spec`

## Compose Commands

Start only the development container:

```bash
docker compose --profile dev up --build
```

Start only the specs container:

```bash
docker compose --profile specs up --build
```

Start both:

```bash
docker compose --profile dev --profile specs up --build
```

Run an interactive shell:

```bash
docker compose --profile dev run --rm dev bash
docker compose --profile specs run --rm specs bash
```

## First-Time Setup

Create the local Codex state directories before the first run:

```bash
mkdir -p workspace/.codex/dev workspace/.codex/specs
mkdir -p workspace/.claude/dev workspace/.claude/specs
chown -R 1000:1000 workspace/.codex
chown -R 1000:1000 workspace/.claude
```

This only needs to be done once per new workspace or after deleting the `.codex/` or `.claude/` directories.

### Windows

On Windows, use the compose override file:

```bash
docker compose -f docker-compose.yml -f docker-compose.windows.yml --profile dev up --build
docker compose -f docker-compose.yml -f docker-compose.windows.yml --profile specs up --build
```

The Windows override removes the explicit `user: "1000:1000"` mapping, because Linux UID/GID assumptions do not translate cleanly to Docker Desktop bind mounts on Windows.

For first-time setup on Windows, create the directories but skip `chown`:

```bash
mkdir workspace\.codex\dev
mkdir workspace\.codex\specs
mkdir workspace\.claude\dev
mkdir workspace\.claude\specs
```

## Notes

- The compose file expects a `workspace/` directory layout with `repo/`, `specs/`, and `notes/`.
- The `dev` container uses persistent caches for `npm`, `pnpm`, and NuGet to avoid unnecessary reinstall overhead.
- Codex and Claude state are stored under `workspace/.codex/` and `workspace/.claude/`.
- Make sure mounted files are writable by UID/GID `1000:1000` if you want the non-root container user to edit them cleanly.
