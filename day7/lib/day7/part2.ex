defmodule Nde2 do
  defstruct name: "",
            children: [],
            weight: 0,
            disc: 0
end

defmodule Day7.Part2 do
  def solve_from_file(filename) do
    {:ok, contents} = File.read(filename)
    solve contents
  end

  def solve(input) do
    nodes = input
            |> String.split("\n")
            |> Enum.reject(fn(line) -> line == "" end)
            |> Enum.map(&parse_node/1)

    # build out branches from the root
    # calculate the weight of each branch

    top_nodes = nodes
               |> Enum.filter(fn(nde) -> Enum.empty?(nde.children) end)
               |> Enum.map(fn(nde) ->
                 %Nde2{name: nde.name, weight: nde.weight, children: [], disc: nde.weight}
               end)

    process(top_nodes, true, nodes)
  end

  # cur_row will be the children being evalulated
  def process(cur_row, balance, _nodes) when balance == false, do: cur_row
  def process(cur_row, balance, nodes) do
    parents = cur_row
              |> Enum.group_by(fn(nde) ->
                Enum.find(nodes, fn(pn) -> Enum.member?(pn.children, nde.name) end)
              end)

    uniqs = Enum.map(parents, fn({parent, children}) ->
                count = children
                        |> Enum.map(fn(child) -> child.disc end)
                        |> Enum.uniq
                        |> Enum.count

                if count == 1 do
                  nil
                else
                  children
                end
              end)

    IO.inspect uniqs, charlists: :as_lists

    unless check_balance(parents) do
      process(parents, false, nodes)
    else
      childs = parents
              |> Enum.map(fn({parent, children}) ->
                total = children
                        |> Enum.map(fn(child) -> child.disc end)
                        |> Enum.sum

                %Nde2{parent | disc: parent.weight + total }
              end)

      process(childs, balance, nodes)
    end
  end

  def check_balance(nodes) do
    Enum.all?(nodes, fn({parent, children}) ->
      count = children
              |> Enum.map(fn(child) -> child.disc end)
              |> Enum.uniq
              |> Enum.count

      count == 1
    end)
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
    %Nde2{name: name, weight: weight, children: []}
  end

  def _parse_node([name_str|[children_str]]) do
    {name, weight} = parse_name name_str
    children = children_str
               |> String.trim
               |> String.split(",")
               |> Enum.map(&String.trim/1)

    %Nde2{name: name, weight: weight, children: children}
  end

  def parse_name(name_str) do
    [_, name, weight] = Regex.run(~r/(.+) \((\d+)\)/, name_str)
    {name, String.to_integer(weight)}
  end
end
