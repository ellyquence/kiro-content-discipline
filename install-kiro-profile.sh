#!/bin/bash

# Kiro Content Discipline Pack Installer
# Installs content creation quality standards to any project

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIRO_SOURCE="$SCRIPT_DIR/.kiro"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Default values
USE_SYMLINK=false
FORCE=false
TARGET_DIR=""

# Help text
show_help() {
    echo "Kiro Content Discipline Pack Installer"
    echo ""
    echo "Usage: $0 [OPTIONS] [TARGET_DIRECTORY]"
    echo ""
    echo "Options:"
    echo "  --symlink    Create symlink instead of copying (recommended for version control)"
    echo "  --force      Overwrite existing .kiro directory"
    echo "  --help       Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0                          # Install to current directory"
    echo "  $0 /path/to/project         # Install to specific project"
    echo "  $0 --symlink                # Create symlink in current directory"
    echo "  $0 --force --symlink ~/blog # Force symlink install to ~/blog"
    echo ""
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --symlink)
            USE_SYMLINK=true
            shift
            ;;
        --force)
            FORCE=true
            shift
            ;;
        --help)
            show_help
            exit 0
            ;;
        -*)
            echo -e "${RED}Unknown option: $1${NC}"
            show_help
            exit 1
            ;;
        *)
            TARGET_DIR="$1"
            shift
            ;;
    esac
done

# Set target directory
if [ -z "$TARGET_DIR" ]; then
    TARGET_DIR="$(pwd)"
fi

# Resolve to absolute path
TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd)" || {
    echo -e "${RED}Error: Target directory does not exist: $TARGET_DIR${NC}"
    exit 1
}

KIRO_TARGET="$TARGET_DIR/.kiro"

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║     Kiro Content Discipline Pack Installer               ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
echo "Source: $KIRO_SOURCE"
echo "Target: $KIRO_TARGET"
echo "Method: $([ "$USE_SYMLINK" = true ] && echo "Symlink" || echo "Copy")"
echo ""

# Check if source exists
if [ ! -d "$KIRO_SOURCE" ]; then
    echo -e "${RED}Error: Source .kiro directory not found at $KIRO_SOURCE${NC}"
    exit 1
fi

# Check if target already exists
if [ -e "$KIRO_TARGET" ]; then
    if [ "$FORCE" = true ]; then
        echo -e "${YELLOW}Removing existing .kiro directory...${NC}"
        rm -rf "$KIRO_TARGET"
    else
        echo -e "${RED}Error: .kiro already exists at $KIRO_TARGET${NC}"
        echo "Use --force to overwrite"
        exit 1
    fi
fi

# Install
if [ "$USE_SYMLINK" = true ]; then
    echo "Creating symlink..."
    ln -s "$KIRO_SOURCE" "$KIRO_TARGET"
    echo -e "${GREEN}✓ Symlink created${NC}"
else
    echo "Copying files..."
    cp -r "$KIRO_SOURCE" "$KIRO_TARGET"
    echo -e "${GREEN}✓ Files copied${NC}"
fi

# Verify installation
echo ""
echo "Verifying installation..."
echo ""

# Check directories
for dir in steering hooks templates settings specs; do
    if [ -d "$KIRO_TARGET/$dir" ]; then
        count=$(ls -1 "$KIRO_TARGET/$dir" 2>/dev/null | wc -l | tr -d ' ')
        echo -e "  ${GREEN}✓${NC} $dir/ ($count files)"
    else
        echo -e "  ${RED}✗${NC} $dir/ (missing)"
    fi
done

echo ""
echo "═══════════════════════════════════════════════════════════"
echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Restart Kiro IDE to activate hooks"
echo "  2. Open a content file to trigger quality checks"
echo "  3. Use 'Kiro: New Spec' to access templates"
echo ""
echo "Steering files installed:"
echo "  • content-global.md   - Core content philosophy"
echo "  • voice-tone.md       - Voice & tone guidelines"
echo "  • quality-gates.md    - 6-stage quality checkpoints"
echo "  • seo-eeat.md         - SEO & E-E-A-T standards"
echo "  • readability.md      - Reading level requirements"
echo "  • structure-frameworks.md - AIDA, PAS, BAB frameworks"
echo "  • headlines.md        - Headline best practices"
echo ""
echo "Templates available:"
echo "  • content-brief.md    - Strategic content brief"
echo "  • blog-post-outline.md - Structure + headlines"
echo "  • voice-profile.md    - Brand voice definition"
echo "  • content-checklist.md - Pre-publish QA"
echo "  • headline-worksheet.md - Headline development"
echo "  • editorial-calendar.md - Planning template"
echo ""
echo "Happy writing! 📝"
echo ""
