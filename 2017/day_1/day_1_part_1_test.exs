Code.load_file("day_1_part_1.ex", __DIR__)

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule Day1Part1Test do
  use ExUnit.Case

  test "1122 produces a sum of 3" do
    assert Day1Part1.captcha_sum(1122) == 3
  end

  test "1111 produces 4" do
    assert Day1Part1.captcha_sum(1111) == 4
  end

  test "1234 produces 0" do
    assert Day1Part1.captcha_sum(1234) == 0
  end

  test "91212129 produces 9" do
    assert Day1Part1.captcha_sum(91212129 ) == 9
  end
end
