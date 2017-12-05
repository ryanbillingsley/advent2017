require IEx

defmodule Day3.Part2 do
  def solve(target) do
    move("RIGHT", {0, 0}, target, %{"0-0": 1})
    |> Map.values
    |> Enum.max
  end

  def move("FINISH", _last_pos, _target, acc), do: acc
  def move(dir, last_pos, target, acc) when dir == "UP" do
    {new_pos, acc} = _create_new_pos last_pos, {0, 1}, acc
    if Map.get(acc, coord_key(new_pos)) > target do
      move("FINISH", {}, 0, acc)
    else
      _move_dir(dir, "LEFT", new_pos, {-1, 0}, target, acc)
    end
  end

  def move(dir, last_pos, target, acc) when dir == "DOWN" do
    {new_pos, acc} = _create_new_pos last_pos, {0, -1}, acc
    if Map.get(acc, coord_key(new_pos)) > target do
      move("FINISH", {}, 0, acc)
    else
      _move_dir(dir, "RIGHT", new_pos, {1, 0}, target, acc)
    end
  end

  def move(dir, last_pos, target, acc) when dir == "LEFT" do
    {new_pos, acc} = _create_new_pos last_pos, {-1, 0}, acc
    if Map.get(acc, coord_key(new_pos)) > target do
      move("FINISH", {}, 0, acc)
    else
      _move_dir(dir, "DOWN", new_pos, {0, -1}, target, acc)
    end
  end

  def move(dir, last_pos, target, acc) when dir == "RIGHT" do
    {new_pos, acc} = _create_new_pos last_pos, {1, 0}, acc
    if Map.get(acc, coord_key(new_pos)) > target do
      move("FINISH", {}, 0, acc)
    else
      _move_dir(dir, "UP", new_pos, {0, 1}, target, acc)
    end
  end

  defp _create_new_pos(last_pos, move, acc) do
    new_pos = add_tuple last_pos, move
    new_key = coord_key new_pos
    {new_pos, Map.put(acc, new_key, add_surrounding(new_pos, acc))}
  end

  defp _move_dir(dir,new_dir, new_pos, move, target, acc) do
    chk_coord = add_tuple(new_pos, move)
    dest = if Map.has_key?(acc, coord_key(chk_coord)) do
      dir
    else
      new_dir
    end

    move(dest, new_pos, target, acc)
  end

  def add_surrounding(coord, grid) do
    [{1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, -1}, {0, -1}, {1, -1}]
    |> Enum.reduce(0, fn(chk_coord, acc) ->
      grid_coord = add_tuple(coord, chk_coord)
      val = Map.get(grid, coord_key(grid_coord), 0)
      acc + val
    end)
  end

  def coord_key(coord) do
    String.to_atom "#{elem(coord, 0)}-#{elem(coord, 1)}"
  end

  def add_tuple(val1, val2) do
    {elem(val1,0) + elem(val2,0), elem(val1,1) + elem(val2,1)}
  end
end
