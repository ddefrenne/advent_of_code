defmodule Day1Part1 do
  def captcha_sum(captcha) do
    digits = Integer.digits(captcha)
    captcha_sum(List.insert_at(digits, -1, hd(digits)), 0)
  end

  defp captcha_sum([ first | [first | tail]], sum) do
    captcha_sum([first | tail], sum + first)
  end

  defp captcha_sum([ first | [second | tail]], sum) do
    captcha_sum([second | tail], sum)
  end

  defp captcha_sum(remainder, sum) when length(remainder) == 1 do
    sum
  end
end
