defmodule Day1 do
  def find_floor(directions, floor \\ 0)
  def find_floor("", floor), do: floor
  def find_floor(directions, floor) do
    {action, remainder} = String.next_codepoint(directions)

    new_floor = _next_floor(action, floor)
    find_floor(remainder, new_floor)
  end

  def enters_basement_at(directions, floor \\ 0, current_index \\ 1) do
    {action, remainder} = String.next_codepoint(directions)
    new_floor = _next_floor(action, floor)

    case new_floor do
      -1 -> current_index
      _ -> enters_basement_at(remainder, new_floor, current_index + 1)
    end
  end

  defp _next_floor(action, current_floor) do
    case action do
      "(" -> current_floor + 1
      ")" -> current_floor - 1
      true -> raise "Wrong input!"
    end
  end
end
