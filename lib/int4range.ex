defmodule Bug.Int4range do
  @behaviour Ecto.Type

  def type, do: :numrange

  def cast([lower, upper]) do
    {:ok, [to_int(lower), to_int(upper)]}
  end
  def cast(_), do: :error

  def load(%Postgrex.Range{lower: lower, upper: nil}) do
    {:ok, [lower, nil]}
  end
  # TODO: handle lower inclusive false
  def load(%Postgrex.Range{lower: lower, upper: upper, upper_inclusive: false}) do
    {:ok, [lower, upper - 1]}
  end
  def load(%Postgrex.Range{lower: lower, upper: upper}) do
    {:ok, [lower, upper]}
  end

  def dump([lower, upper]) do
    {:ok, %Postgrex.Range{lower: lower, upper: upper, upper_inclusive: true}}
  end
  def dump(_), do: :error

  defp to_int(str) when is_binary(str) do
    {int, _} = Integer.parse(str)
    int
  end
  defp to_int(int) when is_integer(int), do: int
end
