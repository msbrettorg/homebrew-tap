class Maenifold < Formula
  desc "Test-time adaptive reasoning infrastructure for AI agents"
  homepage "https://github.com/msbrettorg/maenifold"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.4/maenifold-osx-arm64.tar.gz"
      sha256 "533921eb92b6804c4ac8e9a036480b68c39b0744da4f29aa3eb6287ec4b58fca"
    end
    on_intel do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.4/maenifold-osx-x64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.4/maenifold-linux-arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.4/maenifold-linux-x64.tar.gz"
      sha256 "b26c160a89e6f3da3574b531423ad38ed76859f0974e97808e70a6ddb19e86b9"
    end
  end

  def install
    bin.install "maenifold"
    (share/"maenifold").install "assets" if File.directory?("assets")
  end

  def caveats
    <<~EOS
      maenifold has been installed. To use with Claude Code, install the plugin:
        claude plugin add https://github.com/msbrettorg/maenifold/tree/main/integrations/claude-code/plugin-maenifold
    EOS
  end

  test do
    assert_match "maenifold", shell_output("#{bin}/maenifold --help")
  end
end
