defmodule Day3Test do
  use ExUnit.Case

  test "houses that received at least 1 gift " do
    assert Day3.delivery(">") == 2
    assert Day3.delivery("^>v<") == 4
    assert Day3.delivery("^v^v^v^v") == 2
    assert Day3.delivery("^^^^") == 5
  end

  test "robo santa" do
    assert Day3.robo_delivery("^v") == 3
    assert Day3.robo_delivery("^>v<") == 3
    assert Day3.robo_delivery("^v^v^v^v^v") == 11
    assert Day3.robo_delivery("^v^v^v^v^v><") == 13
  end
end
