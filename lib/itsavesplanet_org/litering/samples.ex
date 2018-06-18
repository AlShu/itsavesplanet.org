defmodule ITSP.Litering.Samples do
  use Ecto.Schema
  import Ecto.Changeset


  schema "literings" do

    timestamps()
  end

  @doc false
  def changeset(samples, attrs) do
    samples
    |> cast(attrs, [])
    |> validate_required([])
  end
end
