defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @vowels ["yt", "xr", "a", "e", "i", "o", "u"]
  @special_consonants ["squ", "thr", "sch", "ch", "qu",  "th"]

  def starts_with_vowel?(word) do
    word |> String.starts_with?(@vowels)
  end

  def swap_prefix(full, prefix) do
    removed_prefix = String.replace_prefix(full, prefix, "")
    case removed_prefix != full do
      true -> {:ok, removed_prefix <> prefix}
      false -> {:error}
    end
  end

  def transform_consonant(word) do
    my_list = @special_consonants ++ [String.first(word)]
              |> Enum.map(fn (x) -> swap_prefix(word, x) end)
    ret_list = for {:ok, term} <- my_list, do: term
    List.first(ret_list)
  end

  def transform(word) do
    swapped = case starts_with_vowel?(word) do
                false -> transform_consonant(word)
                true -> word
              end
    swapped <> "ay"
  end

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    String.split(phrase, " ")
    |> Enum.map_join(" ", fn (x) -> transform(x) end )
  end
end

