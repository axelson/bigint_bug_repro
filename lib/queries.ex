defmodule Bug.Queries do
  defmacro contains(first, second) do
    quote do
      # TODO: WHy is :integer becoming bigint?
      fragment("? @> ?", unquote(first), type(unquote(second), :integer))
      # fragment("? @> ?", unquote(first), type(unquote(second), :string))
      # fragment("? @> ?", unquote(first), unquote(second))
    end
  end
end
