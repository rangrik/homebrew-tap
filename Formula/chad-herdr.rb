class ChadHerdr < Formula
  desc "Custom herdr (rangrik): right-docked agents bar + FIFO attention/working queue"
  homepage "https://herdr.dev"
  version "0.6.8-e32c1b3"
  url "https://github.com/rangrik/homebrew-tap/releases/download/chad-herdr-0.6.8-e32c1b3/herdr-aarch64-macos.tar.gz"
  sha256 "888e656286941bc6ad5edaac042ca5315c9f1d12fb96ab46dc28cb7043ed6619"
  license "AGPL-3.0-or-later"

  # Ships the `herdr` binary so it takes over the `herdr` command. Homebrew only
  # lets one formula own that symlink, so installing this requires uninstalling
  # (or unlinking) homebrew-core's herdr first, and vice-versa to revert.
  conflicts_with "herdr", because: "both install a `herdr` binary"

  def install
    bin.install "herdr"
  end

  test do
    assert_match "0.6.8", shell_output("#{bin}/herdr --version")
  end
end
