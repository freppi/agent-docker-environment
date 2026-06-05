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

## Notes

- The compose file expects a `workspace/` directory layout with `repo/`, `specs/`, and `notes/`.
- The `dev` container uses persistent caches for `npm`, `pnpm`, and NuGet to avoid unnecessary reinstall overhead.
- Make sure mounted files are writable by UID/GID `1000:1000` if you want the non-root container user to edit them cleanly.
