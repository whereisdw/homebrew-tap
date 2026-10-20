# typed: strict
# frozen_string_literal: true

cask "lidnight-limits" do
  version "0.1.0"
  sha256 "f20932573e377d4d29756c0e04723729958064c7e93e2200e96a7f4fb8aba16d"

  url "https://github.com/whereisdw/lidnight-limits/releases/download/v#{version}/LidnightLimits-#{version}.zip"
  name "Lidnight Limits"
  desc "Show Claude Code and Codex usage limits in the menu bar"
  homepage "https://github.com/whereisdw/lidnight-limits"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Lidnight Limits.app"

  uninstall quit: "app.lidnight.limits"

  zap trash: "~/Library/Preferences/app.lidnight.limits.plist"
end
