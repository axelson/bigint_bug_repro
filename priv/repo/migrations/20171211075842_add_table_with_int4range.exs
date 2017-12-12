defmodule Bug.Repo.Migrations.AddTableWithInt4range do
  use Ecto.Migration

  def change do
    create table (:bug_example) do
      add :num_players, :int4range
    end
  end
end
