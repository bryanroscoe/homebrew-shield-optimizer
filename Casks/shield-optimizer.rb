cask "shield-optimizer" do
  version "0.1.0-beta.7"
  sha256 "35c4dd6ad44540254b0ba222364848f8a527a91595563a28e9e7e20fe7762de4"

  url "https://github.com/bryanroscoe/shield_optimizer/releases/download/v2-#{version}/Shield.Optimizer_#{version}_universal.dmg",
      verified: "github.com/bryanroscoe/shield_optimizer/"
  name "Shield Optimizer"
  desc "Debloat and tune Android TV devices via ADB"
  homepage "https://github.com/bryanroscoe/shield_optimizer"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v2-(\d+(?:\.\d+)+(?:-[A-Za-z0-9.]+)?)$/i)
  end

  depends_on :macos

  app "Shield Optimizer.app"

  postflight do
    # Builds are unsigned — Apple Developer ID is $99/yr we're not paying.
    # Homebrew applies a quarantine bit on download which would otherwise
    # trip Gatekeeper on first launch; strip it here so users can open the
    # app normally. Equivalent to `xattr -dr com.apple.quarantine`.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Shield Optimizer.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.shieldoptimizer.app",
    "~/Library/Caches/com.shieldoptimizer.app",
    "~/Library/Preferences/com.shieldoptimizer.app.plist",
    "~/Library/WebKit/com.shieldoptimizer.app",
  ]
end
