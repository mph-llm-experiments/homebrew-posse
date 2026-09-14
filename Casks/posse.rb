cask "posse" do
  version "0.1.11"
  sha256 "2c2d16beb0969dfa18fd13376bc1c723af8a4e6a686441982305d4e3e0efc3cc"

  url "https://dist.puddingtime.net/posse/v#{version}/POSSE_#{version}_aarch64.dmg"
  name "POSSE"
  desc "Personal POSSE publisher (Bluesky, Mastodon, Hugo)"
  homepage "https://github.com/mph-llm-experiments/posse"

  depends_on arch: :arm64

  app "POSSE.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/POSSE.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/net.puddingtime.posse",
    "~/Library/Caches/net.puddingtime.posse",
    "~/Library/WebKit/net.puddingtime.posse"
  ]
end
