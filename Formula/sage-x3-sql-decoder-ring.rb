class SageX3SqlDecoderRing < Formula
  desc "Decodes Sage X3 SQL abbreviations into human-readable table names"
  homepage "https://github.com/catdevman/sage-x3-sql-decoder-ring"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/catdevman/sage-x3-sql-decoder-ring/releases/download/v#{version}/sage-x3-sql-decoder-ring_#{version}_darwin_arm64.tar.gz"
      sha256 "23c16ac1c68c9cb590a4fce52b424f026408bea4b8407bd2ec3b4eb1dd13f5ba"
    end

    on_intel do
      url "https://github.com/catdevman/sage-x3-sql-decoder-ring/releases/download/v#{version}/sage-x3-sql-decoder-ring_#{version}_darwin_amd64.tar.gz"
      sha256 "0932a4dc25ef4ea968eeca5303f27d27bec7f9e59070613e2bd6f7235d65ef10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/catdevman/sage-x3-sql-decoder-ring/releases/download/v#{version}/sage-x3-sql-decoder-ring_#{version}_linux_arm64.tar.gz"
      sha256 "b0658d5a5adfbb139f5194b60cf1217206073f2f5b181c6a904c7427352fa7c1"
    end

    on_intel do
      url "https://github.com/catdevman/sage-x3-sql-decoder-ring/releases/download/v#{version}/sage-x3-sql-decoder-ring_#{version}_linux_amd64.tar.gz"
      sha256 "6b725ae2c0e0d923cd7456d1b9e6814602f5bae908f032c2b3ac94f89bf75c7f"
    end
  end

  def install
    bin.install "sage-x3-sql-decoder-ring"
  end

  test do
    assert_match "BPCUSTOMER", shell_output("echo 'SELECT * FROM BPCUSTOMER' | #{bin}/sage-x3-sql-decoder-ring")
  end
end
