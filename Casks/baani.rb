cask "baani" do
  version "1.0"
  sha256 "e0092a44dfbf7ee3ccbf6c27f752be5dbe7dd7419d49e5d41fcf3336aea0d46d"

  url "https://github.com/rangrik/baani/releases/download/v#{version}/baani-#{version}.dmg"
  name "Baani"
  desc "Notch companion for your GitHub pull requests"
  homepage "https://github.com/rangrik/baani"

  # Internal build, deliberately not notarized — keep autocheck quiet.
  auto_updates false
  depends_on macos: ">= :sequoia"

  app "baani.app"

  # The build isn't notarized, so macOS would otherwise block first launch.
  # Strip the quarantine attribute that brew applies on download — this is the
  # supported replacement for the deprecated `--no-quarantine` flag, scoped to
  # just our own app instead of disabling Gatekeeper globally.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/baani.app"]
  end

  zap trash: [
    "~/Library/Preferences/live.pranav.baani.plist",
    "~/Library/Caches/live.pranav.baani",
  ]
end
