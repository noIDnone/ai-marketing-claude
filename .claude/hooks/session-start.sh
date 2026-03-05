#!/bin/bash
# Session start hook for AI Marketing Suite
# Installs Python dependencies and sets up Claude Code skills

set -euo pipefail

# Only run in remote (Claude Code on the web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

REPO_DIR="$CLAUDE_PROJECT_DIR"

echo "==> Setting up AI Marketing Suite..."

# Install Python dependencies
echo "==> Installing Python dependencies..."
if command -v pip3 &>/dev/null; then
  pip3 install --quiet "reportlab>=4.0"
elif command -v pip &>/dev/null; then
  pip install --quiet "reportlab>=4.0"
else
  echo "WARNING: pip not found — skipping Python dependency install"
fi

# Run the installer to copy skills, agents, scripts, and templates into ~/.claude/
echo "==> Installing marketing skills into Claude Code..."
bash "$REPO_DIR/install.sh"

echo "==> AI Marketing Suite setup complete."
