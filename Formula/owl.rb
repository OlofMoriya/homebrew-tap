class Owl < Formula
  desc "AI assistant with command-line, terminal UI, and HTTP interfaces"
  homepage "https://github.com/OlofMoriya/owl"
  # Owl does not have a tagged release yet.
  url "https://github.com/OlofMoriya/owl/archive/97639ab82fd2dbd586ee346630bdf36e375ad7f8.tar.gz"
  version "0.0.0-20261124"
  sha256 "c775fd40f7fc8d87512e235e2d26b8d0a606660af3c04383ddbe0dae8904472d"

  depends_on "go" => :build
  depends_on :macos

  def install
    ENV["CGO_ENABLED"] = "1"
    ENV["GOTOOLCHAIN"] = "local"

    cd "src" do
      system "go", "build", *std_go_args
    end
  end

  test do
    assert_match "The prompt to use for the conversation", shell_output("#{bin}/owl -help 2>&1")
    assert_path_exists testpath/".owl/debug.log"
  end
end
