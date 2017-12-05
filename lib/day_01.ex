defmodule AOM.Day01 do
  @input "./lib/day_01.input" |> File.read! |> String.trim

  def solve_part(input, offset) do
    list_of_ints = input |> String.graphemes |> Enum.map(&String.to_integer/1)
    list_of_ints |> Enum.with_index |> Enum.reduce(0, fn({i, index}, acc) ->
      if Enum.at(list_of_ints, rem(index + offset, length(list_of_ints))) == i, do: i + acc, else: acc
    end)
  end

  def main do
    IO.puts "Part 1:"
    IO.puts solve_part(@input, 1)
    IO.puts "Part 2:"
    IO.puts solve_part(@input, @input |> String.graphemes |> length |> div(2))
  end
end
