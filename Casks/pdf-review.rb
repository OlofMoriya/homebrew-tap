cask "pdf-review" do
  version "0.1.0"
  sha256 "74fddf8a9c932b2368ab725a20a4fe2da0543510cd235ffb41491bf7ce122b5c"

  url "https://github.com/OlofMoriya/pdf-review/releases/download/v#{version}/PDF-Review-mac.dmg"
  name "PDF Review"
  desc "PDF reader for reviewing documents: annotate, comment, work through review lists"
  homepage "https://github.com/OlofMoriya/pdf-review"

  depends_on macos: ">= :monterey"

  app "PDF Review.app"

  zap trash: "~/.pdf-review"

  caveats <<~EOS
    PDF Review is not signed by a paid Apple developer account. On first launch, open
    System Settings > Privacy & Security and click "Open Anyway" next to PDF Review.
  EOS
end
