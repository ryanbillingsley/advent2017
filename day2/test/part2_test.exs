defmodule Part2Test do
  use ExUnit.Case

    # "5 9 2 8
    #  9 4 7 3
    #  3 8 6 5"
  test "finds the two numbers equal divible by each other [5 9 2 8]" do
    assert Day2.Part2.find_divisibles([5, 9, 2, 8]) == {8, 2} # 4
  end

  test "finds the two numbers equal divible by each other [9 4 7 3]" do
    assert Day2.Part2.find_divisibles([9, 4, 7, 3]) == {9, 3} # 3
  end

  test "finds the two numbers equal divible by each other [3 8 6 5]" do
    assert Day2.Part2.find_divisibles([3, 8, 6, 5]) == {6, 3} # 2
  end

  test "calculates checksum by divisibles" do
    input = "5\t9\t2\t8\n9\t4\t7\t3\n3\t8\t6\t5\n"

    assert Day2.Part2.solve(input) == 9
  end
end
