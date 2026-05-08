cask "posse" do
  version "0.1.3"
  sha256 "d05cfeb5e1bc27c063b191ea3fc58d4d4f60371028b816921e108ef052a53836"

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
