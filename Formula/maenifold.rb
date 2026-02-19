class Maenifold < Formula
  desc "Test-time adaptive reasoning infrastructure for AI agents"
  homepage "https://github.com/msbrettorg/maenifold"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.7/maenifold-osx-arm64.tar.gz"
      sha256 "78762dae29fc8dfd510568c24005f447a8f96125f47b9c28d97ed0c5c8f567cd"
    end
    on_intel do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.7/maenifold-osx-x64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.7/maenifold-linux-arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.7/maenifold-linux-x64.tar.gz"
      sha256 "d0829c524af76b8810233606c7c0bc54b57718fe21c70a79ad79e49425f13a4e"
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
