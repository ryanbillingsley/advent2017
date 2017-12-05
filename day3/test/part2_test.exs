defmodule Part2Test do
  use ExUnit.Case

  test "when the target is 4, value is 5" do
    assert Day3.Part2.solve(4) == 5
  end

  test "when the target is 11, value is 23" do
    assert Day3.Part2.solve(11) == 23
  end

  test "when the target is 50, value is 54" do
    assert Day3.Part2.solve(50) == 54
  end
end
