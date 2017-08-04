defmodule SecretHandshake do
  @actions %{1 => "wink", 2 => "double blink", 4 => "close your eyes", 8 => "jump"}
  @reverse 16

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  use Bitwise
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    case (code &&& @reverse) != 0 do
      true -> code |> get_actions |> Enum.reverse
      false -> code |> get_actions
    end
  end

  @spec get_actions(code :: integer) :: list(String.t())
  def get_actions(code) do
    for {k, v}  <-  @actions, (code &&& k) != 0 do v end
  end
end

