cask "posse" do
  version "0.1.16"
  sha256 "c3823d9e6b98934f1f2689efb2c88f2f8171608cf23b78c61714606b6ff820d3"

  url "https://dist.puddingtime.net/posse/v#{version}/POSSE_#{version}_aarch64.dmg"
  name "POSSE"
  desc "Personal POSSE publisher (Bluesky, Mastodon, Hugo)"
  homepage "https://github.com/mph-llm-experiments/posse"

  depends_on arch: :arm64
  depends_on :macos

  app "POSSE.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/POSSE.app"]
  end

  zap trash: [
    "~/Library/Application Support/net.puddingtime.posse",
    "~/Library/Caches/net.puddingtime.posse",
    "~/Library/WebKit/net.puddingtime.posse",
  ]
end
