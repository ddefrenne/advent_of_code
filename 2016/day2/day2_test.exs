Code.load_file("day2.exs", __DIR__)

ExUnit.start
ExUnit.configure(exclude: :pending, trace: true)

defmodule Day2Test do
  use ExUnit.Case, async: true

  test "You start at '5' and move up (to '2'), left (to '1'), and left (you can't, and stay on '1'), so the first button is 1." do
    assert(Day2.instructions_to_code(["U", "L", "L"], 5) == :"1")
  end

  test "Starting from the previous button ('1'), you move right twice (to '3') and then down three times (stopping at '9' after two moves and ignoring the third), ending up with 9." do
    assert(Day2.instructions_to_code(["R", "R", "D", "D", "D"], 1) == :"9")
  end

  test "Continuing from '9', you move left, up, right, down, and left, ending with 8." do
    assert(Day2.instructions_to_code(["L", "U", "R", "D", "L"], 9) == :"8")
  end

  test "Finally, you move up four times (stopping at '2'), then down once, ending with 5." do
    assert(Day2.instructions_to_code(["U", "U", "U", "U", "D"], 8) == :"5")
  end

  test "Bathroom code is 1985" do
    instructions =
      [
        ["U", "L", "L"],
        ["R", "R", "D", "D", "D"],
        ["L", "U", "R", "D", "L"],
        ["U", "U", "U", "U", "D"],
      ]

    assert(Day2.instructions_to_code(instructions, 5) == "1985")
  end
end
