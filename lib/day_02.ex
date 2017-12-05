defmodule AOM.Day02 do
  @input "./lib/day_02.input" |> File.read! |> String.trim

  defp parse_input(input) do
    input
    |> String.split("\n")
    |> Enum.map(
      fn(line) -> line
      |> String.split("\t")
      |> Enum.map(&String.to_integer/1)
      end)
  end

  def solve_part1(input) do
    parse_input(input)
    |> Enum.map(&(Enum.max(&1) - Enum.min(&1)))
    |> Enum.sum
  end

  def solve_part2(input) do
    parse_input(input)
    |> Enum.reduce(0, fn(line, acc) ->
      tuple_list = for i <- line, j <- line, i != j, do: {i, j}
      {dividend, divisor} = tuple_list |> Enum.find(fn({i, j}) -> rem(i, j) == 0 end)
      acc + div(dividend, divisor)
    end)
  end

  def main do
    IO.puts "Part 1:"
    IO.puts solve_part1(@input)
    IO.puts "Part 2:"
    IO.puts solve_part2(@input)
  end
end
