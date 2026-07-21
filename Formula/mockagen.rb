class Mockagen < Formula
  desc "Generate massive amounts of local mock data blazingly fast"
  homepage "https://github.com/catdevman/mockagen"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catdevman/mockagen/releases/download/v0.1.2/mockagen_0.1.2_darwin_arm64.tar.gz"
      sha256 "1434eaae831463f65795c29e2e0a5e4ef682e17559f8017bd42981a6f14cf0c6"
    else
      url "https://github.com/catdevman/mockagen/releases/download/v0.1.2/mockagen_0.1.2_darwin_amd64.tar.gz"
      sha256 "63d50f9d90618d38f7e2762cd7b3d6d9a40c17c75b753d8e56b094305d1c546d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catdevman/mockagen/releases/download/v0.1.2/mockagen_0.1.2_linux_arm64.tar.gz"
      sha256 "0b388d2083a09f108d5fef51393c1ad45d0d3aeebd40b7e0c2b51f1a3289bd95"
    else
      url "https://github.com/catdevman/mockagen/releases/download/v0.1.2/mockagen_0.1.2_linux_amd64.tar.gz"
      sha256 "fecf43ac9884f37e5b88f66717efc52282f253ed57ff26af7d67dc1c008897c8"
    end
  end

  def install
    bin.install "mockagen"
  end

  test do
    output = shell_output("#{bin}/mockagen -config does-not-exist.json 2>&1", 2)
    assert_match "Issue opening file", output
  end
end
