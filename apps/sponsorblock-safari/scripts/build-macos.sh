#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
UPSTREAM_DIR="$(dirname "$SCRIPT_DIR")/upstream"
XCODE_PROJECT="$UPSTREAM_DIR/SponsorBlock for YouTube - Skip Sponsorships/SponsorBlock.xcodeproj"
SPONSORBLOCK_DIR="$UPSTREAM_DIR/SponsorBlock"

# Check prerequisites
if ! command -v xcodebuild &> /dev/null; then
    echo "ERROR: xcodebuild not found. Install Xcode command-line tools: xcode-select --install" >&2
    exit 1
fi

# Build extension if dist/ missing
if [[ ! -d "$SPONSORBLOCK_DIR/dist" ]]; then
    if ! command -v npm &> /dev/null; then
        echo "ERROR: npm not found and dist/ is missing. Install Node.js or rebuild dist/" >&2
        exit 1
    fi
    echo "Building SponsorBlock extension..."
    cd "$SPONSORBLOCK_DIR"
    npm ci
    npm run build:safari
fi

# Build with Xcode
echo "Building macOS app..."
xcodebuild -project "$XCODE_PROJECT" \
           -scheme "SponsorBlock (macOS)" \
           -configuration Release \
           build

echo "Build complete!"
