class Cliss < Formula
  desc "Animated terminal screensavers: matrix rain, fire, plasma, synthwave and more"
  homepage "https://github.com/IsuruGunarathne/CLISS"
  url "https://github.com/IsuruGunarathne/CLISS/archive/refs/tags/v1.7.tar.gz"
  sha256 "a431e3912a8e76ed776c26c8bda17b300fb71d779afe918ae78e618a1ee56a3c"
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
