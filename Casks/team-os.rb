cask "team-os" do
  version "0.2.6"
  sha256 "46056b46e21f107f97a3a65a208e5b1a7d9eab8dd13513978776c7c970127f3b"

  url "https://github.com/AISquare-PrincePal/homebrew-teamos/releases/download/app-v#{version}/Team-OS_#{version}_aarch64.dmg"
  name "TeamSquare"
  desc "AISquare TeamSquare desktop app"
  homepage "https://github.com/AISquare-PrincePal/homebrew-teamos"

  depends_on arch: :arm64

  app "TeamSquare.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/TeamSquare.app"]
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
