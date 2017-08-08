defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    Regex.split(~r{[_ ,!&@$%^&:]}, String.downcase(sentence))
    |> Enum.reject(&(&1==""))
    |> Enum.reduce(%{}, fn(x, acc) -> Map.update(acc, x, 1, &(&1 + 1)) end)
  end
end
