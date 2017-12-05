defmodule Part2Test do
  use ExUnit.Case
  doctest Day1

  test "1212 produces a sum of 6" do
    assert Day1.Part2.solve("1212") == 6
  end

  test "1221 produces a sum of 0" do
    assert Day1.Part2.solve("1221") == 0
  end

  test "123425 produces a sum of 4" do
    assert Day1.Part2.solve("123425") == 4
  end

  test "123123 produces a sum of 12" do
    assert Day1.Part2.solve("123123") == 12
  end

  test "12131415 produces a sum of 4" do
    assert Day1.Part2.solve("12131415") == 4
  end
end
