class TodoTui < Formula
  desc "Terminal-based todo list manager"
  homepage "https://github.com/OlofMoriya/todo-tui"
  url "https://github.com/OlofMoriya/todo-tui/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "9bc91ce276616f393440aca3305b64539fb38d53e87d7fa3df4b47a5c3d99227"

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
    assert_match "\"outcome\":\"off\"", shell_output("#{bin}/todo-tui sync --json")
  end
end
