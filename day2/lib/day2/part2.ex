defmodule Day2.Part2 do
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
    {max, min} = head
                 |> Enum.map(&String.to_integer/1)
                 |> find_divisibles

    acc = acc + div(max, min)

    diff_row(tail, acc)
  end

  def find_divisibles(list) do
    list
    |> Enum.sort
    |> Enum.reverse
    |> _find_divisibles({})
  end

  defp _find_divisibles([], acc), do: acc
  defp _find_divisibles([head|tail], acc) do
    no_remainder = fn(head, x) -> rem(head, x) == 0 end

    divisible = Enum.any?(tail, &no_remainder.(head, &1))
    if divisible do
      divisor = Enum.find(tail, &no_remainder.(head, &1))
      _find_divisibles([], {head, divisor})
    else
      _find_divisibles(tail, acc)
    end
  end
end
