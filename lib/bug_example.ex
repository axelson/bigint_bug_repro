defmodule Bug.BugExample do
  use Ecto.Schema

  schema "bug_example" do
    field :num_players, Bug.Int4range
  end
end
