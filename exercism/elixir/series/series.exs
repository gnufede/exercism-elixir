defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    diff = String.length(s) - size
    case size > 0 and diff >= 0 do
      false -> []
      true -> Enum.map(Enum.to_list(0..diff), fn(x) -> String.slice(s, x, size) end)
    end
  end
end

