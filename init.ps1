$ErrorActionPreference = "Stop"

Write-Host "Setting up workspace structure"

$WORKSPACE_DIR = "workspace"
$REPO_DIR = Join-Path $WORKSPACE_DIR "repo"
$SPECS_DIR = Join-Path $WORKSPACE_DIR "specs"
$NOTES_DIR = Join-Path $WORKSPACE_DIR "notes"

New-Item -ItemType Directory -Force -Path `
    $WORKSPACE_DIR,
    $REPO_DIR,
    $SPECS_DIR,
    $NOTES_DIR | Out-Null

Write-Host "Structure created"

Get-ChildItem -Recurse $WORKSPACE_DIR