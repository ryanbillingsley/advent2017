defmodule Part1Test do
  use ExUnit.Case

  test "aa bb cc dd ee is valid" do
    assert Day4.Part1.validate_row("aa bb cc dd ee") == true
  end

  test "aa bb cc dd aa is not valid" do
    assert Day4.Part1.validate_row("aa bb cc dd aa") == false
  end

  test "aa bb cc dd aaa is valid" do
    assert Day4.Part1.validate_row("aa bb cc dd aaa") == true
  end

  test "counts the valid rows" do
    input = "aa bb cc dd ee\naa bb cc dd aa\naa bb cc dd aaa\n"

    assert Day4.Part1.solve(input) == 2
  end
end
