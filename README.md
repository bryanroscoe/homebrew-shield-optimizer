# Shield Optimizer — Homebrew tap

Homebrew tap for [Shield Optimizer](https://github.com/bryanroscoe/shield_optimizer), the cross-platform debloater for Nvidia Shield TV, Onn 4K Pro, Chromecast with Google TV, and other Android TV devices.

## Install

```sh
brew tap bryanroscoe/shield-optimizer
brew install --cask shield-optimizer
```

Then launch from Spotlight, Launchpad, or `open -a "Shield Optimizer"`.

Homebrew strips the macOS quarantine bit on download, so you won't see the Gatekeeper "Apple could not verify…" prompt — even though the build itself is unsigned.

## Upgrade

```sh
brew update
brew upgrade --cask shield-optimizer
```

## Uninstall

```sh
brew uninstall --cask shield-optimizer
brew untap bryanroscoe/shield-optimizer   # optional
```

`brew uninstall --zap --cask shield-optimizer` additionally removes the app's preferences and caches.

## What this tap ships

| Cask | Source | Notes |
|---|---|---|
| [`shield-optimizer`](Casks/shield-optimizer.rb) | macOS universal `.dmg` from the [main repo's releases](https://github.com/bryanroscoe/shield_optimizer/releases) | Universal binary; runs natively on Apple Silicon and Intel. |

The cask is bumped automatically by the [release workflow](https://github.com/bryanroscoe/shield_optimizer/blob/main/.github/workflows/v2-release.yml) on every `v2-*` tag push.

## Reporting issues

File bugs on the [main repo](https://github.com/bryanroscoe/shield_optimizer/issues), not here. This tap is just packaging glue.
