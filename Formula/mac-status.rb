class MacStatus < Formula
  desc "Read-only macOS setup and backup dashboard"
  homepage "https://github.com/OlofMoriya/mac-status"
  url "https://github.com/OlofMoriya/mac-status/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "e43f7b4fe1ea62fa066d75cee83260cd8161f1de5c4c40663d0dc60bbddba848"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"plan.toml").write <<~TOML
      [[checks]]
      kind = "path"
      name = "System"
      path = "/System"
    TOML
    assert_match '"state": "present"', shell_output("#{bin}/mac-status --config plan.toml --json")
  end
end
