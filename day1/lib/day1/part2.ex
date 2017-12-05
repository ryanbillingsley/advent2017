defmodule Day1.Part2 do
  def solve(input) do
    list = input
           |> String.split("")
           |> Enum.drop(-1)
           |> Enum.map(&String.to_integer/1)

    check(list, 0, Enum.count(list), list, [])
    |> Enum.sum
  end

  def check([], _index, _list_size, _list, acc), do: acc
  def check([head|tail], index, list_size, list, acc) do
    mirror = determine_pos(index, list_size)
    acc = if(head == Enum.at(list, mirror)) do
      [head|acc]
    else
      acc
    end

    index = index + 1
    check(tail, index, list_size, list, acc)
  end

  def determine_pos(index, list_size) do
    pos = index + div(list_size, 2)
    pos = if pos >= list_size do
      pos - list_size
    else
      pos
    end

    pos
  end
end
