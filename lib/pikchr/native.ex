defmodule Pikchr.Native do
  @moduledoc false

  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :pikchr,
    crate: "pikchr_nif",
    base_url: "https://github.com/neilberkman/pikchr/releases/download/v#{version}",
    force_build: System.get_env("PIKCHR_BUILD") in ["1", "true"],
    version: version,
    nif_versions: ["2.17", "2.16", "2.15"],
    targets: [
      "aarch64-apple-darwin",
      "aarch64-unknown-linux-gnu",
      "x86_64-apple-darwin",
      "x86_64-unknown-linux-gnu"
    ]

  def render(_source, _class, _dark_mode), do: :erlang.nif_error(:nif_not_loaded)
end
