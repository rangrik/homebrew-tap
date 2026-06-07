class SlopHerdr < Formula
  desc "Custom herdr (rangrik): right-docked agents bar + FIFO attention/working queue"
  homepage "https://herdr.dev"
  version "0.6.8.4"
  url "https://github.com/rangrik/homebrew-tap/releases/download/slop-herdr-0.6.8.4/herdr-aarch64-macos.tar.gz"
  sha256 "fe5fc32f2a0433f00f7611fb2dec2f0e036ef96cb574d0e68d3434de16c29d62"
  license "AGPL-3.0-or-later"

  conflicts_with "herdr", because: "both install a `herdr` binary"

  def install
    bin.install "herdr"
  end

  test do
    assert_match "0.6.8", shell_output("#{bin}/herdr --version")
  end
end
