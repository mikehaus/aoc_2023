defmodule Day1 do
  @reg ~r/[a-zA-Z]+/

  def solve() do
    {:ok, input} = File.read("day_1.txt")

    input
    |> parse()
  end

  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, @reg))
    |> Enum.map(&Enum.reject(&1, fn x -> x == "" end))
    |> Enum.map(&Enum.map(&1, fn x -> handle_split(x) end))
    |> IO.inspect(label: "DEBUG")
    |> Enum.map(&List.flatten/1)
    |> Enum.map(fn l -> Enum.reject(l, &(&1 == "")) end)
    |> IO.inspect(label: "DEBUG")
    |> Enum.map(&add_start_and_end/1)
    |> Enum.reject(&is_nil/1)
    |> Enum.map(&(String.to_integer(&1)))
    |> IO.inspect(label: "DEBUG")
    |> Enum.sum()
    |> IO.inspect(label: "DEBUG")
  end

  def handle_split(val) do
    num = String.to_integer(val)
    case num > 9 do
      true -> String.split(val, "")
      _ -> val
    end
  end

  def add_start_and_end(l) do
    l |> IO.inspect(label: "DEBUG")
    [h | t] = l

    case length(l) do
      1 ->
        h <> h

      _ ->
        (h <> List.last(l, t))
    end
  end
end

Day1.solve()
