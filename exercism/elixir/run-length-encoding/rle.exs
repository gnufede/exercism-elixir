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
    Regex.split(~r'(\w)\1*', string, include_captures: true)
    |> Enum.map_join(&encode_chunk(&1))
  end

  @spec encode_chunk(String.t) :: String.t
  def encode_chunk(chunk) do
    len = String.length(chunk)
    if len > 1 do
      Integer.to_string(len) <> String.first(chunk)
    else
      chunk
    end
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.split(~r'(?=\d+)*(?<!\d)', string)
    |> Enum.map_join(&decode_chunk(&1))
  end

  @spec decode_chunk(String.t) :: String.t
  def decode_chunk(chunk) do
    if String.length(chunk) <= 1 do
      chunk
    else
      [_, num, char] = Regex.split(~r'(\d)+', chunk, include_captures: true)
      String.duplicate(char, String.to_integer(num))
    end
  end
end
