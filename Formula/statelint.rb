class Statelint < Formula
  desc "Linter for AWS Step Functions (Amazon States Language) state machines"
  homepage "https://github.com/catdevman/statelint"
  url "https://github.com/catdevman/statelint/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "22ea54a6d0a7e3845e9e41186e7fb752161551aa36d82251a5308e27637739fc"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/statelint"
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
