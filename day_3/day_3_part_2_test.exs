Code.load_file("day_3_part_2.exs", __DIR__)

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule Day3Test do
  use ExUnit.Case

  test "^v delivers presents to 3 houses, because Santa goes north, and then Robo-Santa goes south." do
    assert Day3.number_of_houses_with_both("^v") == 3
  end

  test "^>v< now delivers presents to 3 houses, and Santa and Robo-Santa end up back where they started." do
    assert Day3.number_of_houses_with_both("^>v<") == 3
  end

  test "^v^v^v^v^v now delivers presents to 11 houses, with Santa going one direction and Robo-Santa going the other." do
    assert Day3.number_of_houses_with_both("^v^v^v^v^v") == 11
  end
end
