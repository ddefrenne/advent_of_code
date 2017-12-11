defmodule Day4Part1 do
  def lowest_positive_number(puzzle_input) do
    lowest_positive_number(puzzle_input, 1, false)
  end

  defp lowest_positive_number(puzzle_input, number, false) do
    result = :crypto.hash(:md5, puzzle_input <> Integer.to_string(number))
             |> Base.encode16()

    case String.starts_with?(result, "000000") do
      true -> lowest_positive_number(number, true)
      _ -> lowest_positive_number(puzzle_input, number + 1, false)
    end
  end

  defp lowest_positive_number(answer, true), do: answer
end
