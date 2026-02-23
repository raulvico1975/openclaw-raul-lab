#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HOOKS_DIR="$REPO_ROOT/.githooks"

if [[ ! -f "$HOOKS_DIR/pre-commit" ]]; then
  echo "No s'ha trobat $HOOKS_DIR/pre-commit"
  exit 1
fi

git -C "$REPO_ROOT" config core.hooksPath .githooks
chmod +x "$HOOKS_DIR/pre-commit"

echo "Pre-commit instal·lat. Hooks path: .githooks"
echo "Comprovació ràpida: git config --get core.hooksPath"
