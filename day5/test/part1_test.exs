defmodule Part1Test do
  use ExUnit.Case

  test "finds path out of maze" do
    input = """
            0
            3
            0
            1
            -3
            """
    assert Day5.Part1.solve(input) == 5
  end

  test "process exits when cnt exceeds mzexit" do
    assert Day5.Part1.process(5, 5, 4, []) == 5
  end
end
