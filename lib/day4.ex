defmodule Day4 do
  def run do
    IO.puts solve("yzbqklnj", &five_zeros?/1)
    IO.puts solve("yzbqklnj", &six_zeros?/1)
  end

  def solve input, filter do
    require :crypto

    result =
    for n <- 1..10_000_000,
      hash = :crypto.hash(:md5, "#{input}#{n}"),
      hex = Base.encode16(hash),
      filter.(hex), do: n

    hd(result)
  end

  def five_zeros? hex do
    case hex do
      "00000" <> _ -> true
      _ -> false
    end
  end

  def six_zeros? hex do
    case hex do
      "000000" <> _ -> true
      _ -> false
    end
  end

end
