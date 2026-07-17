cask "team-os" do
  version "0.2.3"
  sha256 "b183930a7642bcbd8a5af2baf408396be3326d4dfde95a0c99bf20a29b1cd666"

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
