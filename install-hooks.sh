#!/bin/bash
#
# Install Content Discipline Hooks
# Copies hooks to current project's .kiro/hooks/ folder
#
# Usage:
#   ./install-hooks.sh                    # Install to current directory
#   ./install-hooks.sh /path/to/project   # Install to specific project
#
# Source: https://github.com/ellyquence/kiro-content-discipline

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_HOOKS="$SCRIPT_DIR/.kiro/hooks"
TARGET_DIR="${1:-.}"
TARGET_HOOKS="$TARGET_DIR/.kiro/hooks"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "Installing content discipline hooks..."
echo "Source: $SOURCE_HOOKS"
echo "Target: $TARGET_HOOKS"
echo ""

# Create target directory
mkdir -p "$TARGET_HOOKS"

# Copy hooks
COPIED=0
for hook in "$SOURCE_HOOKS"/*.kiro.hook; do
  [ -f "$hook" ] || continue
  FILENAME=$(basename "$hook")

  if [ -f "$TARGET_HOOKS/$FILENAME" ]; then
    echo -e "${YELLOW}Skip:${NC} $FILENAME (already exists)"
  else
    cp "$hook" "$TARGET_HOOKS/"
    echo -e "${GREEN}Copied:${NC} $FILENAME"
    COPIED=$((COPIED + 1))
  fi
done

echo ""
echo "Done! $COPIED hooks installed."
echo "Restart Kiro IDE to activate hooks."
