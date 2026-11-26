cask "posse" do
  version "0.1.19"
  sha256 "fdf8ee792052a7407f569f8e293dcf4af6c1797edaa68e12d9e342705c03d69c"

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
