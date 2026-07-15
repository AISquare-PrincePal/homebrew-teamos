# Team OS — Downloads & Homebrew tap

Public distribution point for the **Team OS** Mac app. This repo holds only the built app
(DMG releases), the Homebrew cask, and the installer script. The app source lives in the
private `AISquare-Studio/team-os` repo; the DMG here is just the app shell and contains no
team data. Every release is built automatically on GitHub Actions.

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
