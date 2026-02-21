defmodule Pikchr.MixProject do
  use Mix.Project

  @version "0.5.0"
  @source_url "https://github.com/neilberkman/pikchr"

  def project do
    [
      app: :pikchr,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs(),
      description: "Pikchr diagram renderer for Elixir"
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:rustler, "~> 0.37", optional: true},
      {:rustler_precompiled, "~> 0.8"},
      {:ex_doc, "~> 0.39", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "Pikchr",
      source_url: @source_url,
      source_ref: "v#{@version}",
      extras: ["CHANGELOG.md"]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url, "Changelog" => "#{@source_url}/blob/main/CHANGELOG.md"},
      files: [
        "lib",
        "native/pikchr_nif/src",
        "native/pikchr_nif/Cargo*",
        "native/pikchr_nif/Cross.toml",
        "checksum-*.exs",
        "mix.exs",
        "README.md",
        "CHANGELOG.md",
        "LICENSE"
      ]
    ]
  end
end
