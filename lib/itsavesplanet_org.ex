defmodule ITSP do
  @moduledoc """
  ITSP keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def schema do
    quote do
      use Ecto.Schema
      @timestamps_opts [type: Timex.Ecto.DateTime, autogenerate: {Timex.Ecto.DateTime, :autogenerate, [:usec]}]
    end
  end

  def query do
    quote do
      import Ecto.Query
      import EctoPgExtras
    end
  end
end
