defmodule Day1 do
  def run do
    { :ok, input } = File.read("inputs/day1")
    IO.puts Day1.read(input)
  end

  def read input do
    input |>
    String.graphemes |>
    Enum.with_index |>
    Enum.map(&one_based/1) |>
    Enum.reduce(0, &move_floor/2)
  end

  defp one_based { x, index } do
    { x, index + 1 }
  end

  defp move_floor {char, pos}, floor do
    case char do
      "(" -> up(floor)
      ")" -> alert_basement(down(floor), pos)
    end
  end

  defp up floor do
    floor + 1
  end

  defp down floor do
    floor - 1
  end

  defp alert_basement floor, char_position do
    if floor == -1, do: IO.puts("Went to basement at position: #{char_position}")
    floor
  end

end
