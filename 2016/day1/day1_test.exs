Code.load_file("day1.exs", __DIR__)

ExUnit.start
ExUnit.configure(exclude: :pending, trace: true)

defmodule Day1Test do
  use ExUnit.Case, async: true

  @tag :pending
  test "R2, L3 leaves you 2 block East and 3 blocks North or 5 blocks away" do
    assert(Day1.start(["R2", "L3"]) == 5)
  end

  test "R2, R2, R2 leaves you 2 block due South or 2 blocks away" do
    assert(Day1.start(["R2", "R2", "R2"]) == 2)
  end

  @tag :pending
  test "R5, L5, R5, R3 leaves you 12 blocks away" do
    assert(Day1.start(["R5", "L5", "R5", "R3"]) == 12)
  end

  test "R8, R4, R4, R8: 4 blocks away is visited twice first" do
    assert(Day1.start(["R8", "R4", "R4", "R8"]) == 4)
  end
end
