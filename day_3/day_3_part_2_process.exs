defmodule Day3Part2Process do

  def number_of_houses_for_both do
    input = File.read!("input")
    |> String.trim_trailing
    |> String.graphemes

    %{ santa: santa_path, robo_santa: robo_santa_path } = split_input(input, :robo_santa)

    result_task_santa = 
      Task.async(fn -> number_of_houses(santa_path, [[x: 0, y: 0]]) end)
      |> Task.await
    result_task_robo_santa = 
      Task.async(fn -> number_of_houses(robo_santa_path, [[x: 0, y: 0]]) end)
      |> Task.await

    Enum.sort(result_task_santa++result_task_robo_santa)
    |> Enum.dedup_by(fn([x, y]) -> [x,y] end)
    |> Enum.count
  end

  defp split_input(input_list, previous, acc \\ %{ santa: [], robo_santa: []})
  defp split_input([], _, acc), do: acc

  defp split_input([head | tail], previous, acc) do
    {current_character, new_acc} = case previous do
      :santa -> Map.get_and_update(acc, :robo_santa, fn list ->
        { :robo_santa, list++[head] }
      end)

      :robo_santa -> Map.get_and_update(acc, :santa, fn list ->
        { :santa, list++[head] }
      end)
    end

    split_input(tail, current_character, new_acc)
  end

  defp number_of_houses([move | tail], [[x: last_x, y: last_y] | _] = grid) do
    case move do
      "^" ->
        number_of_houses(tail, [[x: last_x, y: last_y + 1] | grid])
      ">" ->
        number_of_houses(tail, [[x: last_x + 1, y: last_y] | grid])
      "v" ->
        number_of_houses(tail, [[x: last_x, y: last_y - 1] | grid])
      "<" ->
        number_of_houses(tail, [[x: last_x - 1, y: last_y] | grid])
    end
  end

  defp number_of_houses([], grid), do: grid
end
