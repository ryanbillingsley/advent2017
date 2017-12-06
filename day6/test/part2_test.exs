defmodule Part2Test do
  use ExUnit.Case

  test "banks loop in the correct number of cycles" do
    input = "0\t2\t7\t0"
    assert Day6.Part2.solve(input) == 4
  end
end
