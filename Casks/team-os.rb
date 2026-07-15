cask "team-os" do
  version "0.1.1"
  sha256 "b9ecd65926478ebd6d1a0a294ced62096575ffb9940f4e5deb7fca834f5663dd"

  url "https://github.com/AISquare-PrincePal/homebrew-teamos/releases/download/app-v#{version}/Team-OS_#{version}_aarch64.dmg"
  name "Team OS"
  desc "AISquare Team OS desktop app"
  homepage "https://github.com/AISquare-PrincePal/homebrew-teamos"

  depends_on arch: :arm64

  app "Team OS.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Team OS.app"]
  end

  zap trash: [
    "~/Library/Application Support/TeamOS",
    "~/Library/Caches/studio.aisquare.teamos",
    "~/Library/HTTPStorages/studio.aisquare.teamos",
    "~/Library/Preferences/studio.aisquare.teamos.plist",
    "~/Library/Saved Application State/studio.aisquare.teamos.savedState",
    "~/Library/WebKit/studio.aisquare.teamos",
  ]
end
