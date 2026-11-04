# ATV Optimizer — Homebrew tap

Homebrew tap for [ATV Optimizer](https://github.com/bryanroscoe/shield_optimizer) (formerly Shield Optimizer), the cross-platform debloater for Nvidia Shield TV, Onn 4K Pro, Chromecast with Google TV, and other Android TV devices.

## Install

```sh
brew tap bryanroscoe/shield-optimizer
brew install --cask atv-optimizer
```

Then launch from Spotlight, Launchpad, or `open -a "ATV Optimizer"`.

Homebrew strips the macOS quarantine bit on download, so you won't see the Gatekeeper "Apple could not verify…" prompt — even though the build itself is unsigned.

## Upgrade

The cask was called `shield-optimizer` until 2.5.0. `cask_renames.json` maps the old token to
the new one, so an existing install moves over on the next `brew upgrade` and the old name still
works in commands.

```sh
brew update
brew upgrade --cask atv-optimizer
```

## Uninstall

```sh
brew uninstall --cask atv-optimizer
brew untap bryanroscoe/shield-optimizer   # optional
```

`brew uninstall --zap --cask atv-optimizer` additionally removes the app's data folders (old and new names), WebView profile, preferences and caches.

## What this tap ships

| Cask | Source | Notes |
|---|---|---|
| [`atv-optimizer`](Casks/atv-optimizer.rb) | macOS universal `.dmg` from the [main repo's releases](https://github.com/bryanroscoe/shield_optimizer/releases) | Universal binary; runs natively on Apple Silicon and Intel. |

The cask is bumped automatically by the [release workflow](https://github.com/bryanroscoe/shield_optimizer/blob/main/.github/workflows/v2-release.yml) on every `v2-*` tag push.

## Reporting issues

File bugs on the [main repo](https://github.com/bryanroscoe/shield_optimizer/issues), not here. This tap is just packaging glue.
