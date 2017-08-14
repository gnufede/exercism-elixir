defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do

  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.split(~r'(?=\d+)*(?<!\d)', string)
    |> Enum.map_join(&chunk_decode(&1))
  end

  def chunk_decode(chunk) do
    if String.length(chunk) <= 1 do
      chunk
    else
      [_, num, char] = Regex.split(~r'(\d)+', chunk, include_captures: true)
      String.duplicate(char, String.to_integer(num))
    end
  end
end
