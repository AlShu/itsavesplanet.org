defmodule ITSPWeb.Recycling.SamplesController do
  use ITSPWeb, :controller

  alias ITSP.Recycling
  alias ITSP.Recycling.Samples

  def index(conn, _params) do
    recyclings = Recycling.list_recyclings()
    render(conn, "index.html", recyclings: recyclings)
  end

  def new(conn, _params) do
    changeset = Recycling.change_samples(%Samples{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"samples" => samples_params}) do
    case Recycling.create_samples(samples_params) do
      {:ok, samples} ->
        conn
        |> put_flash(:info, "Samples created successfully.")
        |> redirect(to: recycling_samples_path(conn, :show, samples))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    samples = Recycling.get_samples!(id)
    render(conn, "show.html", samples: samples)
  end

  def edit(conn, %{"id" => id}) do
    samples = Recycling.get_samples!(id)
    changeset = Recycling.change_samples(samples)
    render(conn, "edit.html", samples: samples, changeset: changeset)
  end

  def update(conn, %{"id" => id, "samples" => samples_params}) do
    samples = Recycling.get_samples!(id)

    case Recycling.update_samples(samples, samples_params) do
      {:ok, samples} ->
        conn
        |> put_flash(:info, "Samples updated successfully.")
        |> redirect(to: recycling_samples_path(conn, :show, samples))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", samples: samples, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    samples = Recycling.get_samples!(id)
    {:ok, _samples} = Recycling.delete_samples(samples)

    conn
    |> put_flash(:info, "Samples deleted successfully.")
    |> redirect(to: recycling_samples_path(conn, :index))
  end
end
