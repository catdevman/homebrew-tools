class Statelint < Formula
  desc "Linter for AWS Step Functions (Amazon States Language) state machines"
  homepage "https://github.com/catdevman/statelint"
  version "0.0.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catdevman/statelint/releases/download/v#{version}/statelint_#{version}_darwin_arm64.tar.gz"
      sha256 "be519665115f49efe59e814c9658afd0f245f5b4183659766986a5e648e47d33"
    else
      url "https://github.com/catdevman/statelint/releases/download/v#{version}/statelint_#{version}_darwin_amd64.tar.gz"
      sha256 "1a5823ae5bb644ee00b2b262c6c9af7874bc6f1dd0e7dd42d92074a4db010569"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catdevman/statelint/releases/download/v#{version}/statelint_#{version}_linux_arm64.tar.gz"
      sha256 "27148b4c49fc007f88fb716e227eea0ad061c46f7bd69d9aae594d39ee75cba6"
    else
      url "https://github.com/catdevman/statelint/releases/download/v#{version}/statelint_#{version}_linux_amd64.tar.gz"
      sha256 "17b662e9cdb8161ef1a238615336fa7c869a1ea26d31dcd59f94ead1d041d1c5"
    end
  end

  def install
    bin.install "statelint"
  end

  test do
    (testpath/"valid.json").write <<~EOS
      {"StartAt": "Done", "States": {"Done": {"Type": "Succeed"}}}
    EOS
    system bin/"statelint", testpath/"valid.json"

    (testpath/"invalid.json").write <<~EOS
      {"States": {"Stuck": {"Type": "Pass", "End": true}}}
    EOS
    output = shell_output("#{bin}/statelint #{testpath}/invalid.json", 1)
    assert_match "does not have required field", output
  end
end
