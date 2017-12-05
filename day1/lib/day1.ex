defmodule Day1 do
  def solve(input) do
    [first|rest] = input
                   |> String.split("")
                   |> Enum.drop(-1)

    list = ([first | rest] ++ [first])
           |> Enum.map(&String.to_integer/1)
    check(list, [])
    |> Enum.reduce(0, &(&1 + &2))
  end

  def check([_head|[]], acc), do: acc
  def check([head|tail], acc) when is_list(tail) do
    acc = if head == List.first tail do
      [head|acc]
    else
      acc
    end

    check tail,acc
  end
end
