class TodoTui < Formula
  desc "Terminal-based todo list manager"
  homepage "https://github.com/OlofMoriya/todo-tui"
  url "https://github.com/OlofMoriya/todo-tui/archive/4c57f9641228048d1657825b97730a7a90032253.tar.gz"
  version "0.1.0"
  sha256 "d957b5b5a64c8eae07da118d3c8cd73e50a3433665d48d039c8f6311930cceb6"

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
  end
end
