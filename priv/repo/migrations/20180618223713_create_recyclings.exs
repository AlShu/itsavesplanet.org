defmodule ITSP.Repo.Migrations.CreateRecyclings do
  use Ecto.Migration

  def change do
    create table(:recyclings) do

      timestamps()
    end

  end
end
