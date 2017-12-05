defmodule Day3.Part1 do

  def solve(n) do
    coords = spiral(n)
    manhattan({0, 0}, coords)
  end

  def manhattan({p1, p2}, {q1, q2}) do
    abs(p1 - q1) + abs(p2 - q2)
  end

  def spiral(n) do
    k = Float.ceil((:math.sqrt(n) - 1) / 2)
    t = 2 * k + 1
    m = t * t
    t = t - 1

    if n >= m - t do
      {k - (m - n), -k}
    else
      m = m - t
      if n >= m - t do
        {-k, -k + (m - n)}
      else
        m = m - t
        if n >= m - t do
          {-k + (m - n), k}
        else
          {k, k - (m - n - t)}
        end
      end
    end
  end
end
