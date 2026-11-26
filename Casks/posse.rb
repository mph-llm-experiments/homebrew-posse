cask "posse" do
  version "0.1.20"
  sha256 "49faee650fffd0909b6cbc0204727c3f502791e125f4072dac43114e4d499a1f"

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
