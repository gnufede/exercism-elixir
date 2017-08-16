defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, [_ | a]), do: :sublist
  def compare([_ | a], a), do: :superlist
  def compare(a, b) do
    [_ | c] = a
    [_ | d] = b
    compare(a, d)
    compare(c, b)
    :unequal
  end
  def compare([], x) when x != [], do: :unequal
  def compare(x, []) when x != [], do: :unequal
end
