defmodule Day2Test do
  use ExUnit.Case

  test "paper calculation" do
    assert Day2.paper("2x3x4") == 58
    assert Day2.paper("1x1x10") == 43
  end

  test "ribbon calculation" do
    assert Day2.ribbon("2x3x4") == 34
    assert Day2.ribbon("1x1x10") == 14
  end
end
