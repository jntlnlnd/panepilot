#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

swift build -c release

APP_DIR="$ROOT_DIR/.build/app/PanePilot.app"
CONTENTS_DIR="$APP_DIR/Contents"
MACOS_DIR="$CONTENTS_DIR/MacOS"
RESOURCES_DIR="$CONTENTS_DIR/Resources"

rm -rf "$APP_DIR"
mkdir -p "$MACOS_DIR" "$RESOURCES_DIR"

cp "$ROOT_DIR/.build/release/PanePilot" "$MACOS_DIR/PanePilot"
cp "$ROOT_DIR/Sources/PanePilot/Resources/Info.plist" "$CONTENTS_DIR/Info.plist"
if [[ -f "$ROOT_DIR/Sources/PanePilot/Resources/AppIcon.icns" ]]; then
  cp "$ROOT_DIR/Sources/PanePilot/Resources/AppIcon.icns" "$RESOURCES_DIR/AppIcon.icns"
fi

chmod +x "$MACOS_DIR/PanePilot"
codesign --force --deep --sign - "$APP_DIR"

echo "Built $APP_DIR"
