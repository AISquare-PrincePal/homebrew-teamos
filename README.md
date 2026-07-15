# Team OS — Downloads & Homebrew tap

[![Latest release](https://img.shields.io/github/v/release/AISquare-PrincePal/homebrew-teamos?display_name=release&label=latest&color=2563eb)](https://github.com/AISquare-PrincePal/homebrew-teamos/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/AISquare-PrincePal/homebrew-teamos/total?label=downloads&color=2563eb)](https://github.com/AISquare-PrincePal/homebrew-teamos/releases)
[![Views](https://hits.sh/github.com/AISquare-PrincePal/homebrew-teamos.svg?label=views&color=2563eb)](https://github.com/AISquare-PrincePal/homebrew-teamos)

Public distribution point for the **Team OS** Mac app. This repo holds only the built app
(DMG releases), the Homebrew cask, and the installer script. The app source lives in the
private `AISquare-Studio/team-os` repo; the DMG here is just the app shell and contains no
team data. Every release is built automatically on GitHub Actions.

> **Metrics:** *downloads* counts real GitHub release-asset downloads (brew, curl, and manual
> all pull the same DMG, so it's the unified install count). *views* counts README opens
> (approximate, via hits.sh). Exact unique visitors and clones are in the repo's **Insights →
> Traffic** tab (owner-only).

## Install (macOS · Apple Silicon)

### Homebrew

```sh
brew tap AISquare-PrincePal/teamos
brew install --cask team-os
```

On Homebrew 6+, the first install may say the tap is "untrusted" (the cask runs a step to
clear the Gatekeeper quarantine). If so, trust it once and re-run:

```sh
brew trust --cask aisquare-princepal/teamos/team-os
brew install --cask team-os
```

Update later with `brew upgrade --cask team-os`.

### One-line install

```sh
curl -fsSL https://raw.githubusercontent.com/AISquare-PrincePal/homebrew-teamos/main/install.sh | bash
```

### Download the DMG

[![Download Team OS](https://img.shields.io/badge/Download-Team%20OS%20(.dmg)-2563eb?style=for-the-badge&logo=apple&logoColor=white)](https://github.com/AISquare-PrincePal/homebrew-teamos/releases/latest/download/Team-OS-macos-arm64.dmg)

Drag **Team OS** to Applications. The build is ad-hoc signed (not yet notarized), so macOS
Gatekeeper will say **"Team OS is damaged and can't be opened"** on a downloaded copy. It is
not actually damaged, just quarantined. Clear it once in Terminal:

```sh
xattr -dr com.apple.quarantine "/Applications/Team OS.app"
```

Then it opens normally. (Homebrew and the one-liner do this for you automatically, so prefer
them.)

> Apple Silicon (M-series) only for now. Intel support is a planned follow-up.

## Uninstall

Match the method you installed with. Your Claude sign-in (`~/.claude`) is shared with Claude
Code and is never touched by any of these.

### If you installed with Homebrew

```sh
brew uninstall --cask team-os          # removes the app, keeps your local data
brew uninstall --zap --cask team-os    # removes the app AND all local data (brain, chat history)
brew untap AISquare-PrincePal/teamos   # optional: remove the tap
```

### One-line uninstall (any install method)

```sh
# Remove the app (keeps your local data):
curl -fsSL https://raw.githubusercontent.com/AISquare-PrincePal/homebrew-teamos/main/uninstall.sh | bash

# Remove the app AND all local data:
curl -fsSL https://raw.githubusercontent.com/AISquare-PrincePal/homebrew-teamos/main/uninstall.sh | bash -s -- --purge
```

### Manual (if you installed via the DMG)

1. Quit **Team OS** (right-click the Dock icon → Quit, or `⌘Q`).
2. Drag **Team OS** from `/Applications` to the Trash.
3. (Optional) remove leftover files:
   ```sh
   rm -rf "$HOME/Library/Caches/studio.aisquare.teamos" \
          "$HOME/Library/Saved Application State/studio.aisquare.teamos.savedState" \
          "$HOME/Library/Preferences/studio.aisquare.teamos.plist" \
          "$HOME/Library/HTTPStorages/studio.aisquare.teamos" \
          "$HOME/Library/WebKit/studio.aisquare.teamos"
   ```
4. (Optional) remove your local data (brain database, chat history, local repo):
   ```sh
   rm -rf "$HOME/Library/Application Support/TeamOS"
   ```
