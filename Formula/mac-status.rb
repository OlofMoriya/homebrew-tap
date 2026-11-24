class MacStatus < Formula
  desc "Read-only macOS setup and backup dashboard"
  homepage "https://github.com/OlofMoriya/mac-status"
  url "https://github.com/OlofMoriya/mac-status/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3e6cdb360e4a5ef107fa7b1797b2035f0fb084ca8093f5ad45fb6a26a86ca71a"

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
