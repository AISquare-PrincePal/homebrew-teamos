#!/bin/bash
# Team OS uninstaller (macOS).
# Remove the app (keeps your local data):
#   curl -fsSL https://raw.githubusercontent.com/AISquare-PrincePal/homebrew-teamos/main/uninstall.sh | bash
# Remove the app AND all local data (brain database, chat history, local repo):
#   curl -fsSL https://raw.githubusercontent.com/AISquare-PrincePal/homebrew-teamos/main/uninstall.sh | bash -s -- --purge
set -euo pipefail

APP="Team OS"
BUNDLE_ID="studio.aisquare.teamos"
DATA_DIR="$HOME/Library/Application Support/TeamOS"
PURGE=0
[ "${1:-}" = "--purge" ] && PURGE=1

echo "▸ Quitting $APP if it's running…"
osascript -e "quit app \"$APP\"" 2>/dev/null || true
pkill -f "/Applications/$APP.app" 2>/dev/null || true
sleep 1

echo "▸ Removing the app…"
rm -rf "/Applications/$APP.app"

echo "▸ Removing caches, saved state, and preferences…"
rm -rf "$HOME/Library/Caches/$BUNDLE_ID" \
       "$HOME/Library/Saved Application State/$BUNDLE_ID.savedState" \
       "$HOME/Library/Preferences/$BUNDLE_ID.plist" \
       "$HOME/Library/HTTPStorages/$BUNDLE_ID" \
       "$HOME/Library/HTTPStorages/$BUNDLE_ID.binarycookies" \
       "$HOME/Library/WebKit/$BUNDLE_ID"

if [ "$PURGE" = "1" ]; then
  echo "▸ Purging local data (brain database, chat history, local repo)…"
  rm -rf "$DATA_DIR"
elif [ -d "$DATA_DIR" ]; then
  echo ""
  echo "Kept your local data (brain database, chat history, local repo) at:"
  echo "  $DATA_DIR"
  echo "To remove it too, re-run with --purge, or delete it manually:"
  echo "  rm -rf \"$DATA_DIR\""
fi

# Note: your Claude sign-in (~/.claude) is shared with Claude Code and is left untouched.
echo "✓ $APP uninstalled."
