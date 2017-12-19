defmodule Day1Part2 do
  def captcha_sum(captcha) do
    digits = Integer.digits(captcha)
    steps = round(length(digits) / 2)

    Enum.reduce(digits, [0, 0], fn(n, [ci, sum]) ->
      case Enum.at(digits, ci + steps) do
       ^n -> 
          [ci + 1, sum + (2 * n)]
        _ ->
          [ci + 1, sum]
      end
    end)
    |> List.last()
  end
end
