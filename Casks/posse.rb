cask "posse" do
  version "0.1.18"
  sha256 "89d2a358911f4b74d89c019ac62011a48f35221dbd710f2c34457c648af8a0bc"

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
