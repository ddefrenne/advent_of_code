defmodule Day1 do
  def start(input) do
    case start_agent() do
      {:ok, pid} ->
        blocks_away(input, pid)
        |> IO.inspect(label: "blocks away")
        Agent.stop(pid)
      {:error, reason} ->
        IO.inspect(reason, label: "Agent not started")
    end
  end

  defp blocks_away(input, pid) when is_binary(input) do
    case File.read(input) do
      {:ok, contents} ->
        String.trim_trailing(contents) |> String.split(",") |> blocks_away(pid)
      {:error, reason} -> 
        exit(reason)
    end
  end

  defp blocks_away(input, agent_pid), do: blocks_away(input, agent_pid, {0, 0}, "N")

  defp blocks_away([], _, {x, y}, _), do: abs(x) + abs(y)

  defp blocks_away([sequence | remainder], agent_pid, {x, y}, current_cardinal_direction) do
    {new_direction, movement} = String.split_at(sequence, 1)
    movement_count = String.to_integer(movement)

    new_cardinal_direction =
      case current_cardinal_direction do
        "N" ->
          case new_direction do
            "L" -> "W"
            "R" -> "E"
          end
        "E" ->
          case new_direction do
            "L" -> "N"
            "R" -> "S"
          end
        "S" ->
          case new_direction do
            "L" -> "E"
            "R" -> "W"
          end
        "W" ->
          case new_direction do
            "L" -> "S"
            "R" -> "N"
          end
      end

    new_coords =
      case new_cardinal_direction do
        "N" -> {x, y + movement_count}
        "E" -> {x + movement_count, y}
        "S" -> {x, y - movement_count}
        "W" -> {x - movement_count, y}
      end
    check_already_visited(agent_pid, new_coords)

    blocks_away(remainder, agent_pid, new_coords, new_cardinal_direction)
  end

  defp start_agent do
    Agent.start(fn -> MapSet.new end)
  end

  defp check_already_visited(agent_pid, coords) do
    case already_visited?(agent_pid, coords) do
      true -> IO.inspect(coords, label: "already visited")
      _ -> Agent.update(agent_pid, &MapSet.put(&1, coords))
    end
  end

  defp already_visited?(agent_pid, coords) do
    Agent.get(agent_pid, fn set ->
      MapSet.member?(set, coords)
    end)
  end
end
