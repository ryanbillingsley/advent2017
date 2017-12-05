defmodule Part1Test do
  use ExUnit.Case
  doctest Day2

  test "calculates the checksum for the spreadsheet" do
    input = "5\t1\t9\t5\n7\t5\t3\n2\t4\t6\t8\n"

    assert Day2.Part1.solve(input) == 18
  end
end
