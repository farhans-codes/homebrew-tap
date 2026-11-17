cask "ai-limit-status" do
  version "1.0.1"
  sha256 "9fea191877d20b5e15afe8f7b55c1961636c55b7dd43a4647165736b32311947"

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
