cask "posse" do
  version "0.1.1"
  sha256 "7280697a801f5052600b93e142d1676d04eb5aa3aaf9408328df377cea84b8fd"

  url "https://github.com/mph-llm-experiments/posse/releases/download/v#{version}/POSSE_#{version}_aarch64.dmg"
  name "POSSE"
  desc "Personal POSSE publisher (Bluesky, Mastodon, Hugo)"
  homepage "https://github.com/mph-llm-experiments/posse"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  quarantine false

  app "POSSE.app"

  zap trash: [
    "~/Library/Application Support/net.puddingtime.posse",
    "~/Library/Caches/net.puddingtime.posse",
    "~/Library/WebKit/net.puddingtime.posse"
  ]
end
