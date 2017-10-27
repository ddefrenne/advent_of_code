defmodule Day2 do
  def all_feet_of_wrapping_paper(path_to_file) do
    File.stream!(path_to_file)
    |> Stream.map(&String.trim_trailing(&1))
    |> Stream.map(&(feet_of_wrapping_paper(&1)))
    |> Enum.sum
  end

  def all_feet_of_ribbon(path_to_file) do
    File.stream!(path_to_file)
    |> Stream.map(&String.trim_trailing(&1))
    |> Stream.map(&(feet_of_ribbon(&1)))
    |> Enum.sum
  end

  def feet_of_wrapping_paper(dimensions) do
    [l, h, w] = String.split(dimensions, "x")
    |> Enum.map(&String.to_integer(&1))

    sizes = [2 * l * w, 2 * w * h, 2 * h * l]
    Enum.sum(sizes) + Enum.min(sizes) / 2
  end

  def feet_of_ribbon(dimensions) do
    dimensions_by_size = String.split(dimensions, "x")
    |> Enum.map(&String.to_integer(&1))
    |> Enum.sort

    ribbon_to_wrap = 
      Enum.take(dimensions_by_size, 2)
      |> Enum.map(&(&1 + &1))
      |> Enum.sum
    ribbon_for_bow = Enum.reduce(dimensions_by_size, &(&1 * &2))

    ribbon_to_wrap + ribbon_for_bow
  end
end

IO.puts "wrapping paper: #{Day2.all_feet_of_wrapping_paper("input")}"
IO.puts "ribbon: #{Day2.all_feet_of_ribbon("input")}"
