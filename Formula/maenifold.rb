class Maenifold < Formula
  desc "Context engineering infrastructure for AI agents"
  homepage "https://github.com/msbrettorg/maenifold"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.5/maenifold-osx-arm64.tar.gz"
      sha256 "d763f305577e17890632b550303c9fffd09caca3c478ab4b085f39ee8dee6c2f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.5/maenifold-linux-x64.tar.gz"
      sha256 "601ffe95d6e0eb09588af0e36489f8316eee3362635c388deeccd76f52bdba38"
    end
  end

  def install
    # Single-file binary + assets directory. Binary uses AppContext.BaseDirectory
    # to find assets/, so both must live in the same directory.
    libexec.install "maenifold", "assets"
    bin.install_symlink libexec/"maenifold"
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
