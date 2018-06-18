defmodule ITSPWeb.Litering.SamplesController do
  use ITSPWeb, :controller

  alias ITSP.Litering
  alias ITSP.Litering.Samples

  def index(conn, _params) do
    literings = Litering.list_literings()
    render(conn, "index.html", literings: literings)
  end

  def new(conn, _params) do
    changeset = Litering.change_samples(%Samples{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"samples" => samples_params}) do
    case Litering.create_samples(samples_params) do
      {:ok, samples} ->
        conn
        |> put_flash(:info, "Samples created successfully.")
        |> redirect(to: litering_samples_path(conn, :show, samples))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    samples = Litering.get_samples!(id)
    render(conn, "show.html", samples: samples)
  end

  def edit(conn, %{"id" => id}) do
    samples = Litering.get_samples!(id)
    changeset = Litering.change_samples(samples)
    render(conn, "edit.html", samples: samples, changeset: changeset)
  end

  def update(conn, %{"id" => id, "samples" => samples_params}) do
    samples = Litering.get_samples!(id)

    case Litering.update_samples(samples, samples_params) do
      {:ok, samples} ->
        conn
        |> put_flash(:info, "Samples updated successfully.")
        |> redirect(to: litering_samples_path(conn, :show, samples))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", samples: samples, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    samples = Litering.get_samples!(id)
    {:ok, _samples} = Litering.delete_samples(samples)

    conn
    |> put_flash(:info, "Samples deleted successfully.")
    |> redirect(to: litering_samples_path(conn, :index))
  end
end
