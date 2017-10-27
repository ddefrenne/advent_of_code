Code.load_file("day_3.exs", __DIR__)

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule Day3Test do
  use ExUnit.Case

  test "> delivers presents to 2 houses: one at the starting location, and one to the east." do
    assert Day3.number_of_houses(">") == 2
  end

  test "^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location." do
    assert Day3.number_of_houses("^>v<") == 4
  end

  test "^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses." do
    assert Day3.number_of_houses("^v^v^v^v^v") == 2
  end
end
