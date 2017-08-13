defmodule Raindrops do
  @raindrops %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def get_raindrop({drop, value}, number) do
    case Integer.mod(number, drop) do
      0 -> value
      _ -> ""
    end

  end

  def raindrops_of(number) do
    @raindrops
    |> Enum.map(&(get_raindrop(&1, number)))
    |> Enum.join("")
  end

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    case raindrops_of(number) do
      "" -> Integer.to_string(number)
      x -> x
    end
  end

end
