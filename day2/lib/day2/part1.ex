defmodule Day2.Part1 do
  def solve_from_file(filename) do
    {:ok, contents} = File.read(filename)

    solve(contents)
  end

  def solve(input) do
    rows = input
           |> String.trim
           |> String.split("\n")

    result = rows
           |> Enum.map(&String.split/1)
           |> diff_row(0)

    result
  end

  def diff_row([], acc), do: acc
  def diff_row([head|tail], acc) do
    {min, max} = head
                 |> Enum.map(&String.to_integer/1)
                 |> Enum.min_max(head)

    acc = acc + (max - min)

    diff_row(tail, acc)
  end
end
