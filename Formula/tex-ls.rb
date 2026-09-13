class TexLs < Formula
  desc "LaTeX and BibTeX language server, formatter, and linter"
  homepage "https://github.com/backmatter/tex-ls"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/backmatter/tex-ls/releases/download/v0.1.0/tex-ls-aarch64-apple-darwin.tar.gz"
      sha256 "1a054b06521ebd9003f4e5a03c0ada5778002f9d8f34b4247f9c77a55fdd48c6"
    end
    on_intel do
      url "https://github.com/backmatter/tex-ls/releases/download/v0.1.0/tex-ls-x86_64-apple-darwin.tar.gz"
      sha256 "79e0c7162c0ca68c553624fa80ed2d37da2c420273f3e16b9ef0fe5016d5a0ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/backmatter/tex-ls/releases/download/v0.1.0/tex-ls-aarch64-unknown-linux-musl.tar.gz"
      sha256 "51684735ecec70709a49b7e7a935e6fd57416a6a3e634dff49adafaeef158a04"
    end
    on_intel do
      url "https://github.com/backmatter/tex-ls/releases/download/v0.1.0/tex-ls-x86_64-unknown-linux-musl.tar.gz"
      sha256 "58f9d1d950559c7d57cece166f709c2c250cfcc373fe12627f5eb7286a48fcfa"
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
