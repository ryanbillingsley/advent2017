defmodule Part2Test do
  use ExUnit.Case

  test "abcde fghij is a valid passphrase" do
    assert Day4.Part2.validate_row("abcde fghij")
  end

  test "abcde xyz ecdab is not valid" do
    assert !Day4.Part2.validate_row("abcde xyz ecdab")
  end

  test "a ab abc abd abf abj is valid" do
    assert Day4.Part2.validate_row("a ab abc abd abf abj")
  end

  test "iiii oiii ooii oooi oooo is valid" do
    assert Day4.Part2.validate_row("iiii oiii ooii oooi oooo")
  end

  test "oiii ioii iioi iiio is not valid" do
    assert !Day4.Part2.validate_row("oiii ioii iioi iiio")
  end

  test "counts the correct number of rows" do
    input = """
            abcde fghij
            abcde xyz ecdab
            a ab abc abd abf abj
            iiii oiii ooii oooi oooo
            oiii ioii iioi iiio
            """
    assert Day4.Part2.solve(input) == 3
  end
end
