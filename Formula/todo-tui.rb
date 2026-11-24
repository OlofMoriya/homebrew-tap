class TodoTui < Formula
  desc "Terminal-based todo list manager"
  homepage "https://github.com/OlofMoriya/todo-tui"
  url "https://github.com/OlofMoriya/todo-tui/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "d1425778db5b89e93eb7c0c732ced165fd64b245f973074cba962f33950fa332"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "sqlite"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "todo-tui #{version}", shell_output("#{bin}/todo-tui --version")
    system bin/"todo-tui", "add", "Homebrew smoke test", "--due", "0"
    assert_equal "1", shell_output("#{bin}/todo-tui list --count").strip
    system bin/"todo-tui", "delete", "1"
    assert_equal "0", shell_output("#{bin}/todo-tui list --count").strip
    assert_match "Homebrew smoke test", shell_output("#{bin}/todo-tui trash --json")
    system bin/"todo-tui", "restore", "1"
    assert_equal "1", shell_output("#{bin}/todo-tui list --count").strip
    assert_match "\"outcome\":\"off\"", shell_output("#{bin}/todo-tui sync --json")
    assert_equal "[]", shell_output("#{bin}/todo-tui sync log --json").strip
  end
end
