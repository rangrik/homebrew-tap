class SlopHerdr < Formula
  desc "Custom herdr (rangrik): right-docked agents bar + FIFO attention/working queue"
  homepage "https://herdr.dev"
  version "0.6.8.3"
  url "https://github.com/rangrik/homebrew-tap/releases/download/slop-herdr-0.6.8.3/herdr-aarch64-macos.tar.gz"
  sha256 "f119740237b2c4c8013912a744b32667b48a70d613804784a7fec7d175fe4b07"
  license "AGPL-3.0-or-later"

  conflicts_with "herdr", because: "both install a `herdr` binary"

  def install
    bin.install "herdr"
  end

  test do
    assert_match "0.6.8", shell_output("#{bin}/herdr --version")
  end
end
