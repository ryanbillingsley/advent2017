defmodule Part1Test do
  use ExUnit.Case

  test "from square 12 is 3 steps" do
    assert Day3.Part1.solve(12) == 3
  end

  test "from square 23 is 2 steps" do
    assert Day3.Part1.solve(23) == 2
  end

  test "from square 1024 is 31 steps" do
    assert Day3.Part1.solve(1024) == 31
  end
end
