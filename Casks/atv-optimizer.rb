cask "atv-optimizer" do
  version "2.4.1"
  sha256 "32389f987f252047b2c446475b2885a1e8d6e1270fa44da341fc8abecdd97e59"

  url "https://github.com/bryanroscoe/shield_optimizer/releases/download/v2-#{version}/ATV.Optimizer_#{version}_universal.dmg"
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

  postflight_steps do
    # Builds are unsigned — Apple Developer ID is $99/yr we're not paying.
    # Homebrew applies a quarantine bit on download which would otherwise
    # trip Gatekeeper on first launch; strip it here so users can open the
    # app normally. Equivalent to `xattr -dr com.apple.quarantine`.
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/ATV Optimizer.app"]
  end

  zap trash: [
    "~/Library/Application Support/ATVOptimizer",
    "~/Library/Application Support/com.atvoptimizer.app",
    "~/Library/Application Support/com.shieldoptimizer.app",
    "~/Library/Application Support/ShieldOptimizer",
    "~/Library/Caches/com.atvoptimizer.app",
    "~/Library/Caches/com.shieldoptimizer.app",
    "~/Library/HTTPStorages/com.atvoptimizer.app",
    "~/Library/HTTPStorages/com.shieldoptimizer.app",
    "~/Library/Preferences/com.atvoptimizer.app.plist",
    "~/Library/Preferences/com.shieldoptimizer.app.plist",
    "~/Library/Saved Application State/com.atvoptimizer.app.savedState",
    "~/Library/Saved Application State/com.shieldoptimizer.app.savedState",
    "~/Library/WebKit/com.atvoptimizer.app",
    "~/Library/WebKit/com.atvoptimizer.app.unmigrated-*",
    "~/Library/WebKit/com.shieldoptimizer.app",
  ]

  caveats do
    <<~EOS
      Shield Optimizer is now ATV Optimizer, and this cask is now `atv-optimizer`
      (the old `shield-optimizer` token still resolves here).

      From 2.5.0 the app identifier is com.atvoptimizer.app and its data folder is
      ~/Library/Application Support/ATVOptimizer. The first launch copies your
      settings, snapshots and logs from the old locations and leaves the old copies
      in place. Once you are happy, you can delete them:

        ~/Library/Application Support/ShieldOptimizer
        ~/Library/WebKit/com.shieldoptimizer.app

      (the app then asks to download platform-tools again). If a copy of
      "#{appdir}/Shield Optimizer.app" installed outside Homebrew is still there,
      you can delete it too.
    EOS
  end
end
