defmodule Part2Test do
  use ExUnit.Case

  test "finds path out of maze" do
    input = """
            0
            3
            0
            1
            -3
            """
    assert Day5.Part2.solve(input) == 10
  end
end
