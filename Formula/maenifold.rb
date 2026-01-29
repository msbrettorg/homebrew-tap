class Maenifold < Formula
  desc "Test-time adaptive reasoning infrastructure for AI agents"
  homepage "https://github.com/msbrettorg/maenifold"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.3/maenifold-osx-arm64.tar.gz"
      sha256 "eb5c6449de74354a7e198b0eaee030096ed72be01bda40a556767da1c5d8dfe9"
    end
    on_intel do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.3/maenifold-osx-x64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.3/maenifold-linux-arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/msbrettorg/maenifold/releases/download/v1.0.3/maenifold-linux-x64.tar.gz"
      sha256 "612fc620979c4aed01dcaf4347e2b1b7f227a1e5f57c6c1ab901d7e8fbb707d7"
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
