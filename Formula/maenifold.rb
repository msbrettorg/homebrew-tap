class Maenifold < Formula
  desc "Context engineering infrastructure for AI agents"
  homepage "https://github.com/msbrettorg/maenifold"
  version "1.0.6"
  license "MIT"

  on_macos do
    url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.6/maenifold-osx-arm64.zip"
    sha256 "a1c37501b2ac729776dcba86eb0f5cc2be1027a35c844c02a1478de007c46809"
  end

  on_linux do
    url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.6/maenifold-linux-x64.zip"
    sha256 "1661e3fbb0dc9bcd034c78207b1952d1f93807e058dacaa0ac295b275107fed5"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"maenifold"
  end

  def caveats
    <<~EOS
      To use with Claude Code:
        claude plugin marketplace add msbrettorg/maenifold
        claude plugin install maenifold@maenifold-marketplace
    EOS
  end

  test do
    assert_match "maenifold", shell_output("#{bin}/maenifold --help")
  end
end
