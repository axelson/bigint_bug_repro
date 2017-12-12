defmodule Bug do
  @moduledoc """
  Bug keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  import Ecto.Query
  import Bug.Queries

  def test(num \\ 1) do
    query = (from g in Bug.BugExample)
    |> where([g], contains(g.num_players, ^num))

    sql = Bug.Repo.to_sql(:all, query)
    IO.puts("")
    IO.inspect(sql, label: "raw query")

    Bug.Repo.all(query)
  end
end
