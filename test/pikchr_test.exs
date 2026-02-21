defmodule PikchrTest do
  use ExUnit.Case

  test "render basic pikchr to SVG" do
    assert {:ok, svg} = Pikchr.render("box \"Hello\"")
    assert svg =~ "<svg"
    assert svg =~ "</svg>"
    assert svg =~ "Hello"
  end

  test "render! returns SVG directly" do
    svg = Pikchr.render!("box \"Hello\"")
    assert svg =~ "<svg"
  end

  test "render with custom class" do
    {:ok, svg} = Pikchr.render("box \"Hello\"", class: "diagram")
    assert svg =~ "<svg"
    assert svg =~ ~s(class="diagram")
  end

  test "render with dark mode" do
    {:ok, svg} = Pikchr.render("box \"Hello\"", dark_mode: true)
    assert svg =~ "<svg"
  end

  test "render invalid pikchr returns error" do
    assert {:error, _msg} = Pikchr.render("not valid pikchr syntax !!!")
  end

  test "render! raises on invalid input" do
    assert_raise RuntimeError, ~r/Pikchr render error/, fn ->
      Pikchr.render!("not valid pikchr syntax !!!")
    end
  end
end
