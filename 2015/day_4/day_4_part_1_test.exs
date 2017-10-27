Code.load_file("day_4_part_1.ex", __DIR__)

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule Day4Part1Test do
  use ExUnit.Case

  test "If your secret key is abcdef, the answer is 609043, because the MD5 hash of abcdef609043 starts with five zeroes (000001dbbfa...), and it is the lowest such number to do so." do
    assert Day4Part1.lowest_positive_number("abcdef") == 609043
  end

  @tag :pending
  test "If your secret key is pqrstuv, the lowest number it combines with to make an MD5 hash starting with five zeroes is 1048970; that is, the MD5 hash of pqrstuv1048970 looks like 000006136ef...." do
  end
end
