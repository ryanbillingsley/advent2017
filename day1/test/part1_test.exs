defmodule Part1Test do
  use ExUnit.Case
  doctest Day1

  test "1122 produces a sum of 3" do
    assert Day1.Part1.solve("1122") == 3
  end

  test "1111 produces a sum of 4" do
    assert Day1.Part1.solve("1111") == 4
  end

  test "1234 produces a sum of 0" do
    assert Day1.Part1.solve("1234") == 0
  end

  test "91212129 produces a sum of 9" do
    assert Day1.Part1.solve("91212129") == 9
  end
end
