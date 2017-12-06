defmodule Part1Test do
  use ExUnit.Case

  test "banks redistribute in the correct number of cycles" do
    input = "0\t2\t7\t0"
    assert Day6.Part1.solve(input) == 5
  end
end
