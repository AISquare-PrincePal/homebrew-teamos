cask "team-os" do
  version "0.2.10"
  sha256 "1ae276a84b4e517210910bc8383cd15a90eeea3c2808d06950b5166b1fe0ef5c"

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
