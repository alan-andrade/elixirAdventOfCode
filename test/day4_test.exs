defmodule Day4Test do
  use ExUnit.Case

  test "md5 hex hashes" do
    assert Day4.solve("abcdef") == 609043
    assert Day4.solve("pqrstuv") == 1048970
  end
end
