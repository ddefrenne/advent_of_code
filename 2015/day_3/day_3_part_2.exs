defmodule Day3 do
  def number_of_houses_with_both(input) do
    number_of_houses_with_both(String.graphemes(input), :robo_santa, %{ santa: [[x: 0, y: 0]], robo_santa: [[x: 0, y: 0]] })
  end

  defp number_of_houses_with_both([], _, grid) do
    Enum.sort(grid.santa++grid.robo_santa)
    |> Enum.dedup_by(fn([x, y]) -> [x,y] end)
    |> Enum.count
  end

  defp number_of_houses_with_both(["^" | tail], :santa, %{ robo_santa: [[x: last_x, y: last_y] | _] } = grid) do
    { _, updated_grid } = Map.get_and_update(grid, :robo_santa, fn(current_list) ->
      { current_list, [[x: last_x, y: last_y + 1] | current_list] }
    end)
    number_of_houses_with_both(tail, :robo_santa, updated_grid)
  end

  defp number_of_houses_with_both([">" | tail], :santa, %{ robo_santa: [[x: last_x, y: last_y] | _] } = grid) do
    { _, updated_grid } = Map.get_and_update(grid, :robo_santa, fn(current_list) ->
      { current_list, [[x: last_x + 1, y: last_y] | current_list] }
    end)
    number_of_houses_with_both(tail, :robo_santa, updated_grid)
  end

  defp number_of_houses_with_both(["v" | tail], :santa, %{ robo_santa: [[x: last_x, y: last_y] | _] } = grid) do
    { _, updated_grid } = Map.get_and_update(grid, :robo_santa, fn(current_list) ->
      { current_list, [[x: last_x, y: last_y - 1] | current_list] }
    end)
    number_of_houses_with_both(tail, :robo_santa, updated_grid)
  end

  defp number_of_houses_with_both(["<" | tail], :santa, %{ robo_santa: [[x: last_x, y: last_y] | _] } = grid) do
    { _, updated_grid } = Map.get_and_update(grid, :robo_santa, fn(current_list) ->
      { current_list, [[x: last_x - 1, y: last_y] | current_list] }
    end)
    number_of_houses_with_both(tail, :robo_santa, updated_grid)
  end

  defp number_of_houses_with_both(["^" | tail], :robo_santa, %{ santa: [[x: last_x, y: last_y] | _] } = grid) do
    { _, updated_grid } = Map.get_and_update(grid, :santa, fn(current_list) ->
      { current_list, [[x: last_x, y: last_y + 1] | current_list]}
    end)
    number_of_houses_with_both(tail, :santa, updated_grid)
  end

  defp number_of_houses_with_both([">" | tail], :robo_santa, %{ santa: [[x: last_x, y: last_y] | _] } = grid) do
    { _, updated_grid } = Map.get_and_update(grid, :santa, fn(current_list) ->
      { current_list, [[x: last_x + 1, y: last_y] | current_list]}
    end)
    number_of_houses_with_both(tail, :santa, updated_grid)
  end

  defp number_of_houses_with_both(["v" | tail], :robo_santa, %{ santa: [[x: last_x, y: last_y] | _] } = grid) do
    { _, updated_grid } = Map.get_and_update(grid, :santa, fn(current_list) ->
      { current_list, [[x: last_x, y: last_y - 1] | current_list]}
    end)
    number_of_houses_with_both(tail, :santa, updated_grid)
  end

  defp number_of_houses_with_both(["<" | tail], :robo_santa, %{ santa: [[x: last_x, y: last_y] | _] } = grid) do
    { _, updated_grid } = Map.get_and_update(grid, :santa, fn(current_list) ->
      { current_list, [[x: last_x - 1, y: last_y] | current_list]}
    end)
    number_of_houses_with_both(tail, :santa, updated_grid)
  end
end
