defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    for <<c <- text>>, into: "" do
      case c do
        c when c >= 97 -> <<rem((c + shift - 97), 26)+97>>
        c when c < 65 -> <<c>>
        _ -> <<rem((c + shift - 65), 26)+65>>
      end
    end
  end
end

