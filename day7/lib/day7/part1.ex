defmodule Nde do
  defstruct name: "",
            children: [],
            weight: 0
end

defmodule Day7.Part1 do
  def solve_from_file(filename) do
    {:ok, contents} = File.read(filename)
    solve(contents)
  end

  def solve(input) do
    nodes = input
            |> String.split("\n")
            |> Enum.reject(fn(line) -> line == "" end)
            |> Enum.map(&parse_node/1)

    top_node = nodes
               |> Enum.find(fn(node) -> Enum.count(node.children) == 0 end)

    bottom = find_next_node nodes, top_node, nil
    bottom.name
  end

  def find_next_node(_nodes, nde, prev_node) when nde == nil, do: prev_node
  def find_next_node(nodes, node, _prev_node) do
    next_node = nodes
                |> Enum.reject(fn(n) -> Enum.empty?(n.children) end)
                |> Enum.find(fn(n) ->
                     Enum.member?(n.children, node.name)
                   end)

    find_next_node(nodes, next_node, node)
  end

  def parse_node(node) do
    node
    |> String.trim
    |> String.split("->")
    |> _parse_node
  end

  def _parse_node([name_str|children]) when length(children) == 0 do 
    {name, weight} = parse_name name_str
    %Nde{name: name, weight: weight, children: []}
  end

  def _parse_node([name_str|[children_str]]) do
    {name, weight} = parse_name name_str
    children = children_str
               |> String.trim
               |> String.split(",")
               |> Enum.map(&String.trim/1)

    %Nde{name: name, weight: weight, children: children}
  end

  def parse_name(name_str) do
    [_, name, weight] = Regex.run(~r/(.+) \((\d+)\)/, name_str)
    {name, String.to_integer(weight)}
  end
end
