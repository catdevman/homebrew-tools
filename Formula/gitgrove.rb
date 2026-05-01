class Gitgrove < Formula
  desc "GitGrove"
  homepage "https://github.com/catdevman/gitgrove"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/catdevman/gitgrove/releases/download/v0.1.0/gitgrove_darwin_amd64.tar.gz"
      sha256 "6effdf2fa9b402c37476c6639c1b9e67cb5393f98e0204d38aa324ca1f41ff63"
    end

    on_arm do
      url "https://github.com/catdevman/gitgrove/releases/download/v0.1.0/gitgrove_darwin_arm64.tar.gz"
      sha256 "f75128bda165d9144c66e1c1bd613ccf8511e1fd344b8270d2616cfdae889530"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/catdevman/gitgrove/releases/download/v0.1.0/gitgrove_linux_amd64.tar.gz"
      sha256 "f7d97aa2def39917d560a772ec294b4c1f31b51c6248843ba191f764e10305ea"
    end

    on_arm do
      url "https://github.com/catdevman/gitgrove/releases/download/v0.1.0/gitgrove_linux_arm64.tar.gz"
      sha256 "d5e6dcaea684b40d154dbe887416ba1d518778409aa5090fd86cddce4f52a7c6"
    end
  end

  def install
    bin.install "gitgrove"
  end

  test do
    system "#{bin}/gitgrove", "--version"
  end
end
