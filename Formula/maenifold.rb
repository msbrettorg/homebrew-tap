class Maenifold < Formula
  desc "Test-time adaptive reasoning infrastructure for AI agents"
  homepage "https://github.com/msbrettorg/maenifold"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.5/maenifold-osx-arm64.tar.gz"
      sha256 "d763f305577e17890632b550303c9fffd09caca3c478ab4b085f39ee8dee6c2f"
    end
    on_intel do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.5/maenifold-osx-x64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.5/maenifold-linux-arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.5/maenifold-linux-x64.tar.gz"
      sha256 "601ffe95d6e0eb09588af0e36489f8316eee3362635c388deeccd76f52bdba38"
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
