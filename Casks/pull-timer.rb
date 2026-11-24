cask "pull-timer" do
  version "1.1"
  sha256 "96ea10bb6a1588118ef03b48e8f52215fea09709088f8031794fbac2abb0121f"

  url "https://github.com/OlofMoriya/pull-timer/releases/download/v#{version}/PullTimer.zip"
  name "Pull Timer"
  desc "Menu bar timer you set by pulling its icon"
  homepage "https://github.com/OlofMoriya/pull-timer"

  depends_on macos: :ventura

  app "Pull Timer.app"

  caveats <<~EOS
    Pull Timer is not notarized. If macOS blocks the first launch, use
    "Open Anyway" in System Settings > Privacy & Security.
  EOS
end
