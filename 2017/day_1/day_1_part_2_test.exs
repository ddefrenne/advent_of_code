Code.load_file("day_1_part_2.ex", __DIR__)

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule Day1Part2Test do
  use ExUnit.Case

  test "1212 produces 6" do
    assert Day1Part2.captcha_sum(1212) == 6
  end

  test "1221 produces 0" do
    assert Day1Part2.captcha_sum(1221) == 0
  end

  test "123425 produces 4" do
    assert Day1Part2.captcha_sum(123425) == 4
  end

  test "123123 produces 4" do
    assert Day1Part2.captcha_sum(123123) == 12
  end

  test "12131415 produces 4" do
    assert Day1Part2.captcha_sum(12131415) == 4
  end
end
