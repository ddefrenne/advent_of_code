Code.load_file("day_2.exs", __DIR__)

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule Day2Test do
  use ExUnit.Case

  test "A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square feet of wrapping paper plus 6 square feet of slack, for a total of 58 square feet." do
    assert Day2.feet_of_wrapping_paper("2x3x4") == 58
  end

  test "Takes the sum of all wrapping paper" do
    assert Day2.all_feet_of_wrapping_paper("test_input") == 116
  end

  test "A present with dimensions 2x3x4 requires 2+2+3+3 = 10 feet of ribbon to wrap the present plus 2*3*4 = 24 feet of ribbon for the bow, for a total of 34 feet." do
    assert Day2.feet_of_ribbon("2x3x4") == 34
  end
end
