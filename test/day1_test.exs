defmodule Day1Test do
  use ExUnit.Case

  test "floor instructions" do
    assert Day1.read("()()") == 0
    assert Day1.read("(((") == 3
    assert Day1.read("))(((((") == 3
    assert Day1.read(")())())") == -3
    assert Day1.read(")))") == -3
  end
end
