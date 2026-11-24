class MacStatus < Formula
  desc "Read-only macOS setup and backup dashboard"
  homepage "https://github.com/OlofMoriya/mac-status"
  url "https://github.com/OlofMoriya/mac-status/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "79245b86190ec28cc32e2d204dacac5aa590423fcded3b9f235ba25a22c8836b"

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
