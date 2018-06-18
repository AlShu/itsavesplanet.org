defmodule ITSP.Recycling do
  @moduledoc """
  The Recycling context.
  """

  import Ecto.Query, warn: false
  alias ITSP.Repo

  alias ITSP.Recycling.Samples

  @doc """
  Returns the list of recyclings.

  ## Examples

      iex> list_recyclings()
      [%Samples{}, ...]

  """
  def list_recyclings do
    Repo.all(Samples)
  end

  @doc """
  Gets a single samples.

  Raises `Ecto.NoResultsError` if the Samples does not exist.

  ## Examples

      iex> get_samples!(123)
      %Samples{}

      iex> get_samples!(456)
      ** (Ecto.NoResultsError)

  """
  def get_samples!(id), do: Repo.get!(Samples, id)

  @doc """
  Creates a samples.

  ## Examples

      iex> create_samples(%{field: value})
      {:ok, %Samples{}}

      iex> create_samples(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_samples(attrs \\ %{}) do
    %Samples{}
    |> Samples.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a samples.

  ## Examples

      iex> update_samples(samples, %{field: new_value})
      {:ok, %Samples{}}

      iex> update_samples(samples, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_samples(%Samples{} = samples, attrs) do
    samples
    |> Samples.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Samples.

  ## Examples

      iex> delete_samples(samples)
      {:ok, %Samples{}}

      iex> delete_samples(samples)
      {:error, %Ecto.Changeset{}}

  """
  def delete_samples(%Samples{} = samples) do
    Repo.delete(samples)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking samples changes.

  ## Examples

      iex> change_samples(samples)
      %Ecto.Changeset{source: %Samples{}}

  """
  def change_samples(%Samples{} = samples) do
    Samples.changeset(samples, %{})
  end
end
