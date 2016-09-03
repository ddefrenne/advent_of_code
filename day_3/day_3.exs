defmodule Day3 do
  def number_of_houses(input) do
    number_of_houses(String.graphemes(input), [[x: 0, y: 0]])
  end

  defp number_of_houses([], grid), do: Enum.count(grid)

  defp number_of_houses([ "^" | tail ], [ [x: last_x, y: last_y] | _] = grid) do
    filtered_grid = Enum.filter(grid, fn([x: x, y: y]) -> 
      !(x == last_x && y == (last_y + 1))
    end) 
    number_of_houses(tail, [[x: last_x, y: last_y + 1] | filtered_grid])
  end

  defp number_of_houses([ ">" | tail ], [ [x: last_x, y: last_y] | _] = grid) do
    filtered_grid = Enum.filter(grid, fn([x: x, y: y]) -> 
      !(x == (last_x + 1) && y == last_y)
    end) 
    number_of_houses(tail, [[x: last_x + 1, y: last_y] | filtered_grid])
  end

  defp number_of_houses([ "v" | tail ], [ [x: last_x, y: last_y] | _] = grid) do
    filtered_grid = Enum.filter(grid, fn([x: x, y: y]) -> 
      !(x == last_x && y == (last_y - 1))
    end) 
    number_of_houses(tail, [[x: last_x, y: last_y - 1] | filtered_grid])
  end

  defp number_of_houses([ "<" | tail ], [ [x: last_x, y: last_y] | _] = grid) do
    filtered_grid = Enum.filter(grid, fn([x: x, y: y]) -> 
      !(x == (last_x - 1) && y == last_y)
    end) 
    number_of_houses(tail, [[x: last_x - 1, y: last_y] | filtered_grid])
  end
end
