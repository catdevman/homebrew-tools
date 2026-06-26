class Webscour < Formula
  desc "Concurrent web crawler that downloads files matching given extensions"
  homepage "https://github.com/catdevman/webscour"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catdevman/webscour/releases/download/v0.0.2/webscour_darwin_arm64.tar.gz"
      sha256 "9707f28f59b5785c55ca43712eb0121e6e18173242ab1aaa10e1a7b8a1626440"
    else
      url "https://github.com/catdevman/webscour/releases/download/v0.0.2/webscour_darwin_amd64.tar.gz"
      sha256 "eac7cd62fd5e4049610f70510bea76cfa6ba1bbafc8ab86b3da28b564a10bc01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catdevman/webscour/releases/download/v0.0.2/webscour_linux_arm64.tar.gz"
      sha256 "0aa8931b50230eb8f409ad4cf24deb48f52dd15a5d971e62f4fb13599925f3a2"
    else
      url "https://github.com/catdevman/webscour/releases/download/v0.0.2/webscour_linux_amd64.tar.gz"
      sha256 "466ce4ce00a619a6c3a3df82359559a3b40e26d2a2d62c54099f5f5a27b22e36"
    end
  end

  def install
    bin.install "webscour"
  end

  test do
    assert_match "webscour #{version}", shell_output("#{bin}/webscour -version")
  end
end
