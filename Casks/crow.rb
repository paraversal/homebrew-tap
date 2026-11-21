cask "crow" do
  version "0.1.0"
  sha256 "0187812a85c0ccc8d29f4a0165e632e5156139362a991124ff16d11e1611443b"

  url "https://github.com/paraversal/file-crow/releases/download/v#{version}/Crow-#{version}.dmg"
  name "Crow"
  desc "Finder-style file explorer"
  homepage "https://github.com/paraversal/file-crow"

  depends_on macos: ">= :sonoma"

  app "Crow.app"
  binary "#{appdir}/Crow.app/Contents/Resources/crow"

  zap trash: [
    "~/.config/crow",
    "~/.local/state/crow",
    "~/Library/Caches/crow",
    "~/Library/Logs/Crow",
    "~/Library/Saved Application State/io.github.paraversal.crow.savedState",
  ]

  caveats <<~EOS
    Crow is not signed or notarized. The first time you open it, macOS blocks it:
    open System Settings > Privacy & Security and click "Open Anyway", or run
      xattr -dr com.apple.quarantine /Applications/Crow.app
  EOS
end
