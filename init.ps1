$ErrorActionPreference = "Stop"

Write-Host "Setting up workspace structure"

$WORKSPACE_DIR = "workspace"
$REPO_DIR = Join-Path $WORKSPACE_DIR "repo"
$SPECS_DIR = Join-Path $WORKSPACE_DIR "specs"
$NOTES_DIR = Join-Path $WORKSPACE_DIR "notes"
$CODEX_DEV_DIR = Join-Path $WORKSPACE_DIR ".codex/dev"
$CODEX_SPECS_DIR = Join-Path $WORKSPACE_DIR ".codex/specs"
$CLAUDE_DEV_DIR = Join-Path $WORKSPACE_DIR ".claude/dev"
$CLAUDE_SPECS_DIR = Join-Path $WORKSPACE_DIR ".claude/specs"

New-Item -ItemType Directory -Force -Path `
    $WORKSPACE_DIR,
    $REPO_DIR,
    $SPECS_DIR,
    $NOTES_DIR,
    $CODEX_DEV_DIR,
    $CODEX_SPECS_DIR,
    $CLAUDE_DEV_DIR,
    $CLAUDE_SPECS_DIR | Out-Null

Write-Host "Structure created"
Write-Host "Initialized:"
Write-Host "  - $REPO_DIR"
Write-Host "  - $SPECS_DIR"
Write-Host "  - $NOTES_DIR"
Write-Host "  - $WORKSPACE_DIR/.codex"
Write-Host "  - $WORKSPACE_DIR/.claude"

Get-ChildItem -Recurse $WORKSPACE_DIR
