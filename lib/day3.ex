defmodule Day3 do
  require Integer

  def run do
    { :ok, input } = File.read("inputs/day3")
    result = delivery input
    IO.puts "Houses with at least one gift: #{result}"

    result = robo_delivery input
    IO.puts "Robo Santa and Santa wil deliver: #{result}"
  end

  def graphemes input do
    input |> String.graphemes
  end


  def delivery input do
    graphemes(input) |>
    Enum.reduce([], &walk/2) |>
    Enum.uniq |>
    Enum.count
  end

  defp santa({ _char, number }), do: Integer.is_even(number)
  defp robo_santa(x), do: !(santa(x))
  defp just_chars({ char, _ }), do: char

  def robo_delivery input do
    indexed_graphemes = graphemes(input) |> Enum.with_index

    santa =
    indexed_graphemes |>
    Enum.filter(&santa/1) |>
    Enum.map(&just_chars/1) |>
    Enum.reduce([], &walk/2)

    robosanta =
    indexed_graphemes |>
    Enum.filter(&robo_santa/1) |>
    Enum.map(&just_chars/1) |>
    Enum.reduce([], &walk/2)

    (santa ++ robosanta) |> Enum.uniq |> Enum.count
  end

  def walk heading, [] do
    walk heading, [ {0,0} ]
  end

  def walk heading, tracker do
    [ location | _ ] = tracker

    direction = case heading do
      "^" -> :up
      "v" -> :down
      ">" -> :right
      "<" -> :left
    end

    [ move(direction, location) | tracker ]
  end

  defp move direction, { x, y } do
    case direction do
    :up    -> { x    , y + 1 }
    :down  -> { x    , y - 1 }
    :right -> { x + 1, y     }
    :left  -> { x - 1, y     }
    end
  end
end
