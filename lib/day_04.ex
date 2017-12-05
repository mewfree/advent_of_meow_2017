defmodule AOM.Day04 do
  @input "./lib/day_04.input" |> File.read! |> String.trim

  def solve_part1(input) do
    input
    |> String.split("\n")
    |> Enum.map(&(&1 |> String.split(" ")))
    |> Enum.reject(&(&1 |> length != &1 |> Enum.uniq |> length))
    |> length
  end

  def solve_part2(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn(line) ->
      line
      |> String.split(" ")
      |> Enum.map(fn(word) ->
        word
        |> String.split("")
        |> Enum.sort
      end)
    end)
    |> Enum.reject(&(&1 |> length != &1 |> Enum.uniq |> length))
    |> length
  end

  def main do
    IO.puts "Part 1:"
    IO.puts solve_part1(@input)
    IO.puts "Part 2:"
    IO.puts solve_part2(@input)
  end
end
