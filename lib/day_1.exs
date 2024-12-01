IO.puts("hello!!!")

data = IO.read(:eof)
data = String.trim(data)

parse_numbers = fn input ->
  Enum.map(input, &String.to_integer/1)
end

absolute_difference = fn {a, b} ->
  abs(a - b)
end

{left, right} =
  String.split(data, "\n")
  |> Enum.map(&String.split(&1, ~r{ +}))
  |> Enum.map(parse_numbers)
  |> Enum.map(&List.to_tuple/1)
  |> Enum.unzip()

# part one
sorted_left = Enum.sort(left)
sorted_right = Enum.sort(right)

part_one_answer =
  Enum.zip(sorted_left, sorted_right)
  |> Enum.map(absolute_difference)
  |> Enum.sum()

IO.inspect(part_one_answer)

# part two
right_frequencies = Enum.frequencies(sorted_right)

part_two_answer =
  left
  |> Enum.map(fn l -> l * Map.get(right_frequencies, l, 0) end)
  |> Enum.sum()

IO.inspect(part_two_answer)
