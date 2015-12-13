defmodule AocTest do
  use ExUnit.Case
  doctest Aoc

  # Day 1

  defmodule Instructions do
    def read input do
      #chars_with_position
      Enum.reduce(Enum.with_index(String.graphemes(input)),
        0,
        fn ({ char , pos }, floor) ->
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
end
