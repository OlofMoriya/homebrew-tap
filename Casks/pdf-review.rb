cask "pdf-review" do
  version "0.2.1"
  sha256 "761e8c1c5ff40ad34421068a386f614163316b8f3ca392b195d91e9155e9193d"

  url "https://github.com/OlofMoriya/pdf-review/releases/download/v#{version}/PDF-Review-mac.dmg"
  name "PDF Review"
  desc "PDF reader for reviewing documents: annotate, comment, work through review lists"
  homepage "https://github.com/OlofMoriya/pdf-review"

  depends_on macos: :monterey

  app "PDF Review.app"

  zap trash: "~/.pdf-review"

  caveats <<~EOS
    PDF Review is not signed by a paid Apple developer account. On first launch, open
    System Settings > Privacy & Security and click "Open Anyway" next to PDF Review.
  EOS
end
