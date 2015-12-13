defmodule Day2 do
  def run do
    { :ok, presents } = File.read("inputs/day2")
    input = String.split(presents, "\n")

    input |>
    Enum.filter(&is_not_empty/1) |>
    Enum.reduce(0, &(ribbon(&1) + &2))
  end

  def paper [l, w, h] do
    ( 2 * l * w +
      2 * w * h +
      2 * h * l
    ) + Enum.min [ l * w,
                   w * h,
                   h * l ]
  end

  def paper input do
    input |> parse |> paper
  end

  def ribbon [l, w, h] do
    (l * w * h) +
    Enum.min [ 2 * l + 2 * w,
               2 * h + 2 * l,
               2 * h + 2 * w ]
  end

  def ribbon input do
    input |> parse |> ribbon
  end

  defp parse input do
    input |>
    String.split("x") |>
    Enum.map(&String.to_integer/1)
  end

  defp is_not_empty(input) do
    input != ""
  end
end

