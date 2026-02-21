# Pikchr

[![Hex.pm](https://img.shields.io/hexpm/v/pikchr.svg)](https://hex.pm/packages/pikchr)
[![CI](https://github.com/neilberkman/pikchr/actions/workflows/release.yml/badge.svg)](https://github.com/neilberkman/pikchr/actions/workflows/release.yml)

[Pikchr](https://pikchr.org) diagram renderer for Elixir. Renders PIC-like markup to SVG using a Rust NIF wrapping the [pikchr](https://crates.io/crates/pikchr) crate.

## Installation

Add `pikchr` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pikchr, "~> 0.5.0"}
  ]
end
```

Precompiled NIFs are available for aarch64/x86_64 on macOS and Linux. To build from source, set `PIKCHR_BUILD=true` and ensure you have a Rust toolchain installed.

## Usage

```elixir
# Render a diagram to SVG
{:ok, svg} = Pikchr.render(~s[box "Hello" "World"])

# Bang variant raises on error
svg = Pikchr.render!(~s[arrow right 200% "Elixir" above])

# Custom CSS class (default: "pikchr")
{:ok, svg} = Pikchr.render(~s[box "Hello"], class: "diagram")

# Dark mode
{:ok, svg} = Pikchr.render(~s[box "Hello"], dark_mode: true)
```

### With MDEx

Use as a [codefence renderer](https://github.com/leandrocp/mdex) to render pikchr blocks in Markdown:

```elixir
MDEx.to_html!(markdown,
  codefence_renderers: %{
    "pikchr" => fn _lang, _meta, code -> Pikchr.render!(code) end
  }
)
```

## License

MIT
