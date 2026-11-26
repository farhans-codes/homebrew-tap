cask "ai-limit-status" do
  version "1.1.0"
  sha256 "388026608bdcaf6006a6b59da84e600eb9ab63097a001e20d2b6e8a6f3bd3b65"

  url "https://github.com/farhans-codes/ai_limit_status/releases/download/v#{version}/AI-Limit-Status-macOS.dmg"
  name "AI Limit Status"
  desc "Menu bar monitor for Claude Code and Codex usage limits"
  homepage "https://github.com/farhans-codes/ai_limit_status"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app installs its own updates from Settings.
  auto_updates true
  depends_on macos: :ventura

  app "AI Limit Status.app"

  zap trash: [
    "~/Library/Application Support/AI Limit Status",
    "~/Library/Logs/AI Limit Status",
    "~/Library/Preferences/com.ailimitstatus.aiLimitStatus.plist",
  ]

  caveats <<~EOS
    AI Limit Status is not notarized by Apple. If macOS says it can't be
    opened, open it once from System Settings > Privacy & Security >
    Open Anyway.
  EOS
end
