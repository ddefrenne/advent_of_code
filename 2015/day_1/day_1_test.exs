Code.load_file("day_1.exs", __DIR__)

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule Day1Test do
  use ExUnit.Case, async: false

  test "(()) results in floor 0" do
    assert(Day1.find_floor("(())") == 0)
  end

  test "()() results in floor 0" do
    assert(Day1.find_floor("()()") == 0)
  end

  test "((( and (()(()( both result in floor 3" do
    assert(Day1.find_floor("(((") == 3)
    assert(Day1.find_floor("(()(()(") == 3)
  end

  test "))((((( also results in floor 3" do
    assert(Day1.find_floor("))(((((") == 3)
  end

  test "()) and ))( both result in floor -1 (the first basement level)" do
    assert(Day1.find_floor("())") == -1)
    assert(Day1.find_floor("))(") == -1)
  end

  @tag :pending
  test ") causes him to enter the basement at character position 1" do
    assert Day1.enters_basement_at(")") == 1
  end

  test "()()) causes him to enter the basement at character position 5" do
    assert Day1.enters_basement_at("()())") == 5
  end
end
