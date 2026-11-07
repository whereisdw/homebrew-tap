# typed: strict
# frozen_string_literal: true

cask "lidnight" do
  version "1.11.43"
  sha256 "6392a646bd6701f0237b17dcb6f777743c176d2c9d727790ea07a493ac9c9752"

  url "https://lidnight.app/download/Lidnight-#{version}.dmg"
  name "Lidnight"
  desc "Keep a MacBook awake with the lid closed while AI agents work"
  homepage "https://lidnight.app/"

  livecheck do
    url "https://lidnight.app/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Lidnight.app"

  uninstall launchctl: "app.lidnight.reset-sleep",
            quit:      "app.lidnight.Lidnight",
            script:    {
              executable: "/usr/bin/pmset",
              args:       ["-a", "disablesleep", "0"],
              sudo:       true,
            },
            delete:    [
              "/etc/sudoers.d/lidnight",
              "/Library/LaunchDaemons/app.lidnight.reset-sleep.plist",
              "/Library/PrivilegedHelperTools/lidnight-power",
              "/Library/PrivilegedHelperTools/lidnight-smc",
            ]

  zap trash: [
    "~/.lidnight",
    "~/Library/Preferences/app.lidnight.Lidnight.plist",
  ]
end
