class Cliss < Formula
  desc "Animated terminal screensavers: matrix rain, fire, plasma, synthwave and more"
  homepage "https://github.com/IsuruGunarathne/CLISS"
  url "https://github.com/IsuruGunarathne/CLISS/archive/refs/tags/v2.1.tar.gz"
  sha256 "2d7a0aea747950affd3d23a140374362373b5ea64940518cc75d2fec84453cc2"
  license "MIT"

  uses_from_macos "python"

  def install
    # the launcher finds Animations/ next to its real path, through the symlink
    libexec.install "cliss", "Animations"
    (libexec/"Animations/VERSION").write "v#{version}\n"
    bin.install_symlink libexec/"cliss"
  end

  test do
    assert_match "cliss v#{version}", shell_output("#{bin}/cliss --version")
    assert_match "Matrix", shell_output("#{bin}/cliss list")
  end
end
