cask "posse" do
  version "0.1.22"
  sha256 "009e6b27d615b947bbb75470fff0d3b214dcdc935b2b61f5a17288e6762193bd"

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
