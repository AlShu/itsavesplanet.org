defmodule ITSP.Repo.Migrations.CreateLiterings do
  use Ecto.Migration

  def change do
    create table(:literings) do

      timestamps()
    end

  end
end
