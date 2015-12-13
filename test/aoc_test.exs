defmodule AocTest do
  use ExUnit.Case
  doctest Aoc

  # Day 1

  defmodule Instructions do
    def read input do
      input |>
      String.graphemes |>
      Enum.with_index |>
      Enum.reduce(0, fn ({ char , pos }, floor) ->
        case char do
          "(" -> floor + 1
          ")" ->
            if floor == 0,  do: IO.puts pos + 1

            floor - 1
        end
      end)
    end
  end

  test "floor instructions" do
    assert Instructions.read("()()") == 0
    assert Instructions.read("(((") == 3
    assert Instructions.read("))(((((") == 3
    assert Instructions.read(")())())") == -3
    assert Instructions.read(")))") == -3
  end

  # Run
  IO.puts "RUN"
  { :ok, input } = File.read("inputs/day1")
  IO.puts Instructions.read(input)
  IO.puts "END"


  # Day 2

  defmodule Elves do
    def parse input do
      input |>
      String.split("x") |>
      Enum.map(fn (x) -> String.to_integer(x) end)
    end

    def paper [l, w, h] do
      x =  2*l*w + 2*w*h + 2*h*l
      [a1, a2, a3] = [l*w, w*h, h*l]

      x + min(a1, min(a2, a3))
    end

    def paper input do
      input |> parse |> paper
    end

    def ribbon [l, w, h] do
      # Shorter distance around its sides
      # or smallest 
      x = 2*l + 2*w
      y = 2*h + 2*l
      z = 2*h + 2*w

      min(x, min(y, z)) + (l * w * h)
    end

    def ribbon input do
      input |> parse |> ribbon
    end

    def remove_empty(input) do
      input |> Enum.filter(fn (x) -> x != "" end)
    end
  end

  test "paper calculation" do
    assert Elves.paper("2x3x4") == 58
    assert Elves.paper("1x1x10") == 43
  end

  test "ribbon calculation" do
    assert Elves.ribbon("2x3x4") == 34
    assert Elves.ribbon("1x1x10") == 14
  end

  { :ok, presents } = File.read("inputs/day2")
  input = String.split(presents, "\n")

  input |>
  Enum.reduce(0, fn (input, acc) ->
    if input == "" do
      acc
    else
      acc + Elves.ribbon input
    end
  end) |>
  IO.puts
end
