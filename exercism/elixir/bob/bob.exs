defmodule Bob do
  def is_silence?(input) do
    String.trim(input) == ""
  end

  def is_question?(input) do
    String.last(input) == "?"
  end

  def is_all_uppercase?(input) do
    String.upcase(input) == input and String.downcase(input) != input
  end

  def is_shouting?(input) do
    not is_question?(input) and is_all_uppercase?(input)
  end

  def hey(input) do
    cond do
      is_silence?(input) -> "Fine. Be that way!"
      is_question?(input) -> "Sure."
      is_shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
