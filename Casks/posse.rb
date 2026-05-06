cask "posse" do
  version "0.1.0"
  sha256 "409190c200eac3facd3e8d9c469ce35de2de5fcbca6b2ff2877c2b36625a7227"

  url "https://github.com/mph-llm-experiments/posse/releases/download/v#{version}/POSSE_#{version}_aarch64.dmg"
  name "POSSE"
  desc "Personal POSSE publisher (Bluesky, Mastodon, Hugo)"
  homepage "https://github.com/mph-llm-experiments/posse"

  livecheck do
    url :url
    strategy :github_latest
  end

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
    "~/Library/WebKit/net.puddingtime.posse",
  ]
end
