cask "pdf-review" do
  version "0.2.3"
  sha256 "b9f183f6e261fef541828059ea2108b5aaea2012e99f1b9363c0cece255993b5"

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
