defmodule Pikchr do
  @moduledoc """
  Render [Pikchr](https://pikchr.org) diagram markup to SVG.

  Pikchr is a PIC-like markup language for diagrams.

  ## Examples

      {:ok, svg} = Pikchr.render(~s[box "Hello"])

      svg = Pikchr.render!(~s[box "Hello"])
  """

  @doc """
  Render Pikchr source to SVG.

  ## Options

    * `:class` - CSS class for the SVG element. Defaults to `"pikchr"`.
    * `:dark_mode` - Enable dark mode rendering. Defaults to `false`.
  """
  def render(source, opts \\ []) do
    class = Keyword.get(opts, :class, "pikchr")
    dark_mode = Keyword.get(opts, :dark_mode, false)
    Pikchr.Native.render(source, class, dark_mode)
  end

  @doc """
  Same as `render/2` but raises on error.
  """
  def render!(source, opts \\ []) do
    case render(source, opts) do
      {:ok, svg} -> svg
      {:error, msg} -> raise "Pikchr render error: #{msg}"
    end
  end
end
