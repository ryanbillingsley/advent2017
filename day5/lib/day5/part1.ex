require IEx

defmodule Day5.Part1 do
  def solve_from_file(filename) do
    {:ok, contents} = File.read(filename)
    solve(contents)
  end

  def solve(input) do
    instructs = input
                   |> String.trim
                   |> String.split("\n")
                   |> Enum.map(&String.trim/1)
                   |> Enum.map(&String.to_integer/1)

    process(0, 0, Enum.count(instructs), instructs)
  end

  def process(cur_inst, cnt, mzexit, _instrcts) when cur_inst >= mzexit, do: cnt
  def process(cur_inst, cnt, mzexit, instrcts) do
    movement = Enum.at(instrcts, cur_inst)
    next_inst = cur_inst + movement
    updated_instrcts = List.replace_at instrcts, cur_inst, movement + 1
    process(next_inst, cnt + 1, mzexit, updated_instrcts)
  end
end
