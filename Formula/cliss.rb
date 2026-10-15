class Cliss < Formula
  desc "Animated terminal screensavers: matrix rain, fire, plasma, synthwave and more"
  homepage "https://github.com/IsuruGunarathne/CLISS"
  url "https://github.com/IsuruGunarathne/CLISS/archive/refs/tags/v1.13.tar.gz"
  sha256 "c204fba192c30a590a721223b20bd9220b5f39cd71ccf94dab7d7ec2000df5f3"
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
