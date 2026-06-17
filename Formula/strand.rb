class Strand < Formula
  desc "Local AI agent harness with durable, queryable memory"
  homepage "https://github.com/ralaruri/strand"
  url "https://github.com/ralaruri/homebrew-strand/releases/download/v0.1.0/strand-macos.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  version "0.1.0"

  def install
    bin.install "strand"
  end

  def post_install
    claude_md = Pathname.new(ENV["HOME"]) / ".claude" / "CLAUDE.md"
    claude_md.parent.mkpath
    snippet = <<~SNIPPET

      ## strand — persistent memory

      strand is installed. Use it to persist facts and search history across sessions.

          strand memory set "key" "value"   # store something
          strand memory get "key"           # retrieve it
          strand memory list                # see everything stored
          strand history --search "topic"   # search past sessions
          strand cost                       # check cumulative API spend
          strand query "<sql>"              # raw SQL against full history

      Database: ~/.local/share/strand/db.duckdb
    SNIPPET
    unless claude_md.exist? && claude_md.read.include?("strand is installed")
      claude_md.open("a") { |f| f.write(snippet) }
    end
  end

  test do
    system "#{bin}/strand", "--version"
  end
end
