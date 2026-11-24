class MacStatus < Formula
  desc "Read-only macOS setup and backup dashboard"
  homepage "https://github.com/OlofMoriya/mac-status"
  url "https://github.com/OlofMoriya/mac-status/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4cc9a6ae1ef5140b75a17d59799c2dc11338256d9bffb2bf9776b82d695389f0"

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
