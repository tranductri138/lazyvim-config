#!/bin/bash
# Quick update script - run after pulling new changes from git

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

echo "🔄 Updating LazyVim config..."

# Backup current
BACKUP_DIR="$HOME/.config/nvim-backup-$(date +%Y%m%d-%H%M%S)"
cp -r "$HOME/.config/nvim" "$BACKUP_DIR" 2>/dev/null || true

# Copy new config
cp -r "$REPO_ROOT/lua" "$HOME/.config/nvim/"

echo "✓ Config updated!"
echo "Backup saved to: $BACKUP_DIR"
echo ""
echo "Run :Lazy sync in nvim to update plugins"
