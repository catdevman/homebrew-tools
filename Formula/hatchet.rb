class Hatchet < Formula
  desc "Single-binary accessibility testing CLI powered by axe-core and headless Chrome"
  homepage "https://github.com/catdevman/hatchet"
  url "https://github.com/catdevman/hatchet/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "eeb7897798ab04d70534396dc88b0d3f03c9b332adb1e87da5876be506580376"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/hatchet"
  end

  def caveats
    <<~EOS
      hatchet needs a Chrome/Chromium browser. If none is installed, run:
        hatchet browser install
    EOS
  end

  test do
    system "#{bin}/hatchet", "--version"
  end
end
