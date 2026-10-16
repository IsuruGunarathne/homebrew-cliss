class Cliss < Formula
  desc "Animated terminal screensavers: matrix rain, fire, plasma, synthwave and more"
  homepage "https://github.com/IsuruGunarathne/CLISS"
  url "https://github.com/IsuruGunarathne/CLISS/archive/refs/tags/v2.2.tar.gz"
  sha256 "1f41f9149cf3a9833347454730d7f40a80fcd7a97d0a4bc04f244a4aac954aac"
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
