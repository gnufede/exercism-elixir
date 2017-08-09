defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.split(~r{[_ ,!&@$%^&:-]}, string)
    |> Enum.map(&(get_upcase_and_first/1))
    |> Enum.join("")
  end

  def get_upcase_and_first(string) do
    case String.graphemes(string) do
      [] -> []
      [head | tail] -> [String.upcase(head) | Enum.filter(tail, &(&1 =~ ~r/^\p{Lu}$/u))]
    end
  end

end
