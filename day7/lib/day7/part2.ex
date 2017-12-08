defmodule Day7.Part2 do
  def solve_from_file(filename, root) do
    {:ok, contents} = File.read(filename)
    solve(contents, root)
  end

  def solve(input, root) do
    nodes = input
            |> String.split("\n")
            |> Enum.reject(fn(line) -> line == "" end)
            |> Enum.map(&parse_node/1)

    # build out branches from the root
    # calculate the weight of each branch

    top_nodes = nodes
               |> Enum.filter(fn(nde) -> Enum.empty?(nde.children) end)
    IO.inspect top_nodes


    # top_node = nodes
    #            |> Enum.find(fn(node) -> Enum.count(node.children) == 0 end)

    # bottom = find_next_node nodes, top_node, nil
    # bottom.name
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
