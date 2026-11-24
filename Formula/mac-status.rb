class MacStatus < Formula
  desc "Read-only macOS setup and backup dashboard"
  homepage "https://github.com/OlofMoriya/mac-status"
  url "https://github.com/OlofMoriya/mac-status/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "7fb88c04bd42fbabf0452459f6feb3e64874e5347370916b6136efc0edc94a4a"

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
