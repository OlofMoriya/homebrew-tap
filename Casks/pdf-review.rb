cask "pdf-review" do
  version "0.2.2"
  sha256 "db65308b3806755d9f46cbf74f406c93a19b615f8228a88388d40983694ec01f"

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
