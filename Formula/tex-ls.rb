class TexLs < Formula
  desc "LaTeX and BibTeX language server, formatter, and linter"
  homepage "https://github.com/backmatter/tex-ls"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/backmatter/tex-ls/releases/download/v0.1.2/tex-ls-aarch64-apple-darwin.tar.gz"
      sha256 "51134004d4a73820a0a0d77c63b83b9431e7e4274c2d480b31ef34bcf70ea529"
    end
    on_intel do
      url "https://github.com/backmatter/tex-ls/releases/download/v0.1.2/tex-ls-x86_64-apple-darwin.tar.gz"
      sha256 "2626b560a7ac8a0b6970a73e5c1fad1ea065b9de3a8ec01c67e3e8317fcc635b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/backmatter/tex-ls/releases/download/v0.1.2/tex-ls-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fe8e35a4052d6fb8f4778c3c6ebacff119268812f0ccc8bf1a0efb8ec9af9696"
    end
    on_intel do
      url "https://github.com/backmatter/tex-ls/releases/download/v0.1.2/tex-ls-x86_64-unknown-linux-musl.tar.gz"
      sha256 "adb4ad843088cb4bf3041f8ca5172980846a17eeee97df930f15d08657a7d81a"
    end
  end

  def install
    bin.install "tex-ls"
    pkgshare.install "unicode-math.LICENSE", "unicode-math.NOTICE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tex-ls --version")
    (testpath/"main.tex").write("\\section{Hello}\nA short paragraph.\n")
    system bin/"tex-ls", "--no-config", "format", "main.tex"
    system bin/"tex-ls", "--no-config", "format", "--check", "main.tex"
    system bin/"tex-ls", "--no-config", "lint", "main.tex"
  end
end
