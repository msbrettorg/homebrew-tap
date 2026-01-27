class Maenifold < Formula
  desc "Test-time adaptive reasoning infrastructure for AI agents"
  homepage "https://github.com/msbrettorg/maenifold"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/msbrettorg/maenifold/releases/download/v#{version}/maenifold-osx-arm64.tar.gz"
      sha256 "PLACEHOLDER_OSX_ARM64"
    end
    on_intel do
      url "https://github.com/msbrettorg/maenifold/releases/download/v#{version}/maenifold-osx-x64.tar.gz"
      sha256 "PLACEHOLDER_OSX_X64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/msbrettorg/maenifold/releases/download/v#{version}/maenifold-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/msbrettorg/maenifold/releases/download/v#{version}/maenifold-linux-x64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X64"
    end
  end

  def install
    bin.install "maenifold"
    # Install assets directory alongside binary
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
