defmodule Day3 do
  def number_of_houses(input) do
    number_of_houses(String.graphemes(input), [[x: 0, y: 0]])
  end

  defp number_of_houses([], grid) do
    Enum.sort(grid)
    |> Enum.dedup_by(fn([x, y]) -> [x,y] end)
    |> Enum.count
  end

  defp number_of_houses([ "^" | tail ], [ [x: last_x, y: last_y] | _] = grid) do
    number_of_houses(tail, [[x: last_x, y: last_y + 1] | grid])
  end

  defp number_of_houses([ ">" | tail ], [ [x: last_x, y: last_y] | _] = grid) do
    number_of_houses(tail, [[x: last_x + 1, y: last_y] | grid])
  end

  defp number_of_houses([ "v" | tail ], [ [x: last_x, y: last_y] | _] = grid) do
    number_of_houses(tail, [[x: last_x, y: last_y - 1] | grid])
  end

  defp number_of_houses([ "<" | tail ], [ [x: last_x, y: last_y] | _] = grid) do
    number_of_houses(tail, [[x: last_x - 1, y: last_y] | grid])
  end
end
