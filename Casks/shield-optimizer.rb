cask "shield-optimizer" do
  version "0.1.0-beta.1"
  sha256 "0a6611326a8abb56bd346752973861237e6541781c9d8c1c28e300a2779e1473"

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

  app "Shield Optimizer.app"

  zap trash: [
    "~/Library/Application Support/com.shieldoptimizer.app",
    "~/Library/Preferences/com.shieldoptimizer.app.plist",
    "~/Library/WebKit/com.shieldoptimizer.app",
    "~/Library/Caches/com.shieldoptimizer.app",
  ]
end
