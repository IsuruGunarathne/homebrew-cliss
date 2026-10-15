class Cliss < Formula
  desc "Animated terminal screensavers: matrix rain, fire, plasma, synthwave and more"
  homepage "https://github.com/IsuruGunarathne/CLISS"
  url "https://github.com/IsuruGunarathne/CLISS/archive/refs/tags/v2.0.tar.gz"
  sha256 "ff8a2f8caa45850c9f3f92ba7fdc64f32ab0791ca038363e3ea2c241833a8732"
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
