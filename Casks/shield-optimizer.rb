cask "shield-optimizer" do
  version "2.3.0"
  sha256 "72e02d12f184cf7a20ca1e340049573e6a32132cfd9fcc5716da97bada527de1"

  url "https://github.com/bryanroscoe/shield_optimizer/releases/download/v2-#{version}/ATV.Optimizer_#{version}_universal.dmg",
      verified: "github.com/bryanroscoe/shield_optimizer/"
  name "ATV Optimizer"
  name "Shield Optimizer"
  desc "Debloat and tune Android TV devices via ADB (formerly Shield Optimizer)"
  homepage "https://github.com/bryanroscoe/shield_optimizer"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v2-(\d+(?:\.\d+)+(?:-[A-Za-z0-9.]+)?)$/i)
  end

  depends_on :macos

  app "ATV Optimizer.app"

  postflight do
    # Builds are unsigned — Apple Developer ID is $99/yr we're not paying.
    # Homebrew applies a quarantine bit on download which would otherwise
    # trip Gatekeeper on first launch; strip it here so users can open the
    # app normally. Equivalent to `xattr -dr com.apple.quarantine`.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ATV Optimizer.app"],
                   sudo: false
  end

  caveats do
    <<~EOS
      Shield Optimizer is now called ATV Optimizer. The cask token is unchanged
      (`brew upgrade --cask shield-optimizer` keeps working), but the installed
      bundle is now "#{appdir}/ATV Optimizer.app".

      Your settings, saved snapshots and downloaded platform-tools are untouched:
      the app identifier and its data folder did not change.

      Homebrew removes the old bundle it installed. If a copy installed some
      other way (for example from the DMG) is still there, you can delete it:

        rm -rf "#{appdir}/Shield Optimizer.app"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/com.shieldoptimizer.app",
    "~/Library/Caches/com.shieldoptimizer.app",
    "~/Library/Preferences/com.shieldoptimizer.app.plist",
    "~/Library/WebKit/com.shieldoptimizer.app",
  ]
end
