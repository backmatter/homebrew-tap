class TexLs < Formula
  desc "LaTeX and BibTeX language server, formatter, and linter"
  homepage "https://github.com/backmatter/tex-ls"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/backmatter/tex-ls/releases/download/v0.1.3/tex-ls-aarch64-apple-darwin.tar.gz"
      sha256 "2887d821143915bbcfe09480dfaf8119ef0433ae8febfa294cb563ca1030ce75"
    end
    on_intel do
      url "https://github.com/backmatter/tex-ls/releases/download/v0.1.3/tex-ls-x86_64-apple-darwin.tar.gz"
      sha256 "354351c9d57945a133ea6f555697cf1f18945673e97b03b8af20fd9cc5a74222"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/backmatter/tex-ls/releases/download/v0.1.3/tex-ls-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fa463cc60bebcf434e19b5eadeae5abf3d5b3f09d2d19c76bc9d4798496dcb4f"
    end
    on_intel do
      url "https://github.com/backmatter/tex-ls/releases/download/v0.1.3/tex-ls-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0b472f62271cfff0947e79d1da67a18f562b50b7b17b2db0e10f4d425ff86aa1"
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
