cask "shield-optimizer@2.0.0" do
  version "2.0.0"
  sha256 "f90b16a53d244aaf14d7945343206b604c33888d91ab53ecc94d23f9f54b1bba"

  url "https://github.com/bryanroscoe/shield_optimizer/releases/download/v2-#{version}/Shield.Optimizer_#{version}_universal.dmg",
      verified: "github.com/bryanroscoe/shield_optimizer/"
  name "Shield Optimizer"
  desc "Debloat and tune Android TV devices via ADB"
  homepage "https://github.com/bryanroscoe/shield_optimizer"

  # Pinned version — no livecheck. Use the unversioned `shield-optimizer` cask
  # to track the latest release.
  conflicts_with cask: "bryanroscoe/shield-optimizer/shield-optimizer"

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
