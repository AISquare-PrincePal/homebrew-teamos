# Team OS: Downloads & Homebrew tap

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

## First run: what to do

> **GitHub must be connected for Team OS to work.** It is how the app loads the shared team
> brain, so complete step 2 before expecting any data.

1. **Open Team OS.** It checks for your Claude sign-in:
   - If you already have **Claude Code** installed and signed in, the app picks up that session
     automatically and shows your name, nothing to do.
   - If not, it walks you through a couple of in-app steps: install the engine and
     **Sign in with Claude** (uses your existing Claude subscription, no API key, no terminal).
2. **Connect your tools.** Open **Connectors** and connect Gmail, Google Calendar, Google Drive,
   and Slack (these open Claude's connector page), then click **Connect** on **GitHub** and sign in
   with your work GitHub account. GitHub is what lets the app load the shared team brain.
3. **Your local brain builds itself.** Once GitHub is connected, the app **automatically** downloads
   the shared team knowledge and builds your local brain the first time it needs it, so you don't
   have to do anything. If it hasn't appeared, open **Connectors** and click **"Load team brain"**
   to trigger it. When it's ready the card shows **"Loaded: N facts."**
4. **Gather.** Click **Gather** to pull what's new from your connected tools into your brain as
   private facts. Now the board, triage, and chat have data to work with.

## Where your data lives

Everything stays **local to your Mac**, under `~/Library/Application Support/TeamOS/`:

- `brain.db` is your local brain (SQLite): shared facts + your private facts + the company-docs index.
- `team-os/` is the shared knowledge repo the brain is built from (fetched automatically).

Your **private facts never leave your machine.** Only items you explicitly approve through the Share
gate are pushed to the team's GitHub repo. Deleting that folder just makes the app rebuild the brain
on next launch (you'd only lose local-only private facts and chat history).

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
