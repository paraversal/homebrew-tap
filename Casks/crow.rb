cask "crow" do
  version "0.1.0"
  sha256 "e183c6fbe2698ad0f6ea76159cc8643e0b4497675a254e0cfd2c05866be630dc"

  url "https://github.com/paraversal/crow/releases/download/v#{version}/Crow-#{version}.dmg"
  name "Crow"
  desc "Finder-style file explorer"
  homepage "https://github.com/paraversal/crow"

  depends_on macos: :sonoma

  app "Crow.app"
  binary "#{appdir}/Crow.app/Contents/Resources/crow"

  zap trash: [
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
