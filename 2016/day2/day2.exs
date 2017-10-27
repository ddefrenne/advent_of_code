defmodule Day2 do
  def instructions_from_file(filename, start) do
    File.open(filename, [:read])
    |> handle_file(start)
  end
 
  def handle_file({:ok, filepid}, start) do
    IO.stream(filepid, :line)
    |> Stream.map(&String.trim_trailing(&1))
    |> Stream.map(&String.codepoints(&1))
    |> Enum.to_list
    |> instructions_to_code(start)
  end

  def handle_file({:error, reason}, _) do
    IO.warn("File could not be opened: #{reason}")
  end

  def instructions_to_code(instructions, start) when is_integer(start) do
    instructions_to_code(instructions, Integer.to_string(start) |> String.to_atom)
  end

  def instructions_to_code([], start), do: start

  def instructions_to_code(instructions = [instruction_row | _], start) when is_list(instruction_row) do
    Enum.reduce(instructions, [], fn(row, acc) -> 
      begin = 
        case Enum.empty?(acc) do
          true -> start
          _ -> hd(acc)
        end
      [instructions_to_code(row, begin) | acc]
    end)
    |> Enum.reverse
    |> Enum.join("")
  end

  def instructions_to_code([instruction | remaining_instructions], start) do
    instructions_to_code(remaining_instructions, instruction_to_key(instruction, start))
  end

  defp instruction_to_key(instruction, start) do
    case instruction do
      "U" ->
        Keyword.get(["1": :"1", "2": :"2", "3": :"3", "4": :"1", "5": :"2", "6": :"3", "7": :"4", "8": :"5", "9": :"6"], start)
      "R" ->
        Keyword.get(["1": :"2", "2": :"3", "3": :"3", "4": :"5", "5": :"6", "6": :"6", "7": :"8", "8": :"9", "9": :"9"], start)
      "D" ->
        Keyword.get(["1": :"4", "2": :"5", "3": :"6", "4": :"7", "5": :"8", "6": :"9", "7": :"7", "8": :"8", "9": :"9"], start)
      "L" ->
        Keyword.get(["1": :"1", "2": :"1", "3": :"2", "4": :"4", "5": :"4", "6": :"5", "7": :"7", "8": :"7", "9": :"8"], start)
    end
  end
end
