defmodule Day4.Part1 do
  def solve_from_file(filename) do
    {:ok, contents} = File.read(filename)
    solve(contents)
  end

  def solve(input) do
    input
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&validate_row/1)
    |> Enum.count(fn(row) -> row end)
  end

  def validate_row(row_str) do
    list = row_str
           |> String.trim
           |> String.split

    Enum.count(list) == list |> Enum.uniq |> Enum.count
  end
end
