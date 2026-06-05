#!/usr/bin/env bash
set -euo pipefail

echo "Setting up workspace structure"

WORKSPACE_DIR="./workspace"
REPO_DIR="$WORKSPACE_DIR/repo"
SPECS_DIR="$WORKSPACE_DIR/specs"
NOTES_DIR="$WORKSPACE_DIR/notes"
CODEX_DEV_DIR="$WORKSPACE_DIR/.codex/dev"
CODEX_SPECS_DIR="$WORKSPACE_DIR/.codex/specs"
CLAUDE_DEV_DIR="$WORKSPACE_DIR/.claude/dev"
CLAUDE_SPECS_DIR="$WORKSPACE_DIR/.claude/specs"

mkdir -p \
  "$REPO_DIR" \
  "$SPECS_DIR" \
  "$NOTES_DIR" \
  "$CODEX_DEV_DIR" \
  "$CODEX_SPECS_DIR" \
  "$CLAUDE_DEV_DIR" \
  "$CLAUDE_SPECS_DIR"

if command -v chown >/dev/null 2>&1; then
  chown -R 1000:1000 "$WORKSPACE_DIR/.codex" "$WORKSPACE_DIR/.claude" 2>/dev/null || true
fi

echo "Workspace created"
echo "Initialized:"
echo "  - $REPO_DIR"
echo "  - $SPECS_DIR"
echo "  - $NOTES_DIR"
echo "  - $WORKSPACE_DIR/.codex"
echo "  - $WORKSPACE_DIR/.claude"


#export ANTHROPIC_MODEL="$ANTHROPIC_MODEL"
#export ANTHROPIC_BASE_URL="$ANTHROPIC_BASE_URL"
#export ANTHROPIC_AUTH_TOKEN="$ANTHROPIC_AUTH_TOKEN"
#export ANTHROPIC_DEFAULT_SONNET_MODEL="$ANTHROPIC_DEFAULT_SONNET_MODEL"
#export ANTHROPIC_CUSTOM_HEADERS="$ANTHROPIC_CUSTOM_HEADERS"
#export CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS="$CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS"

# --------------------------------------------------
# Done
# --------------------------------------------------
echo "done"
