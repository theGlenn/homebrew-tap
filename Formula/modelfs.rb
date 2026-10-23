class Modelfs < Formula
  desc "Keep one copy of every local AI model, however many apps use it"
  homepage "https://glennso.dev/modelfs"
  url "https://github.com/theGlenn/modelfs/releases/download/v0.1.0/modelfs-0.1.0-macos-universal.tar.gz"
  sha256 "30b81ceaf578f9ad8b8107261159af4993a0171dde0f4ebe98e432821a58702b"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on :macos

  def install
    bin.install "modeld"
  end

  def caveats
    <<~EOS
      To deduplicate new downloads in the background, start the login agent:
        modeld daemon install
      Run it again after `brew upgrade modelfs`: the agent keeps its own copy
      of the binary.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/modeld --version")
  end
end
