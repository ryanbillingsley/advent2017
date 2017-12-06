defmodule Day6.Part2 do
  def solve_from_file(filename) do
    {:ok, contents} = File.read(filename)
    solve(contents)
  end

  def solve(input) do
    banks = input
            |> String.trim
            |> String.split("\t")
            |> Enum.map(&String.trim/1)
            |> Enum.map(&String.to_integer/1)

    redistribute banks, 0, 0, []
  end

  def redistribute([], count, _itr, _acc), do: count
  def redistribute(banks, count, itr, acc) do
    {max_idx, max_val} = maxxes(banks)

    result = banks
             |> List.replace_at(max_idx, 0)
             |> increment(max_idx + 1, max_val)

    count = count + 1

    if Enum.any?(acc, fn(bnk) -> bnk == result end) do
      if itr < 1 do
        redistribute result, 0, itr + 1, [result]
      else
        redistribute [], count, itr, acc
      end
    else
      redistribute result, count, itr, [result|acc]
    end
  end

  def maxxes(banks) do
    max_val = banks
              |> Enum.max
    max_index = banks
                |> Enum.find_index(fn(val) -> val == max_val end)
    {max_index, max_val}
  end

  def increment(banks, _index, val) when val == 0, do: banks
  def increment(banks, index, val) when index == length(banks), do: increment(banks, 0, val)
  def increment(banks, index, val) do
    curr = Enum.at banks, index
    banks = List.replace_at banks, index, curr + 1
    increment banks, index + 1, val - 1
  end
end
