defmodule ITSPWeb.Elixir.Litering.SamplesControllerTest do
  use ITSPWeb.ConnCase

  alias ITSP.Litering

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:samples) do
    {:ok, samples} = Litering.create_samples(@create_attrs)
    samples
  end

  describe "index" do
    test "lists all literings", %{conn: conn} do
      conn = get conn, litering_samples_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Literings"
    end
  end

  describe "new samples" do
    test "renders form", %{conn: conn} do
      conn = get conn, litering_samples_path(conn, :new)
      assert html_response(conn, 200) =~ "New Samples"
    end
  end

  describe "create samples" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, litering_samples_path(conn, :create), samples: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == litering_samples_path(conn, :show, id)

      conn = get conn, litering_samples_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Samples"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, litering_samples_path(conn, :create), samples: @invalid_attrs
      assert html_response(conn, 200) =~ "New Samples"
    end
  end

  describe "edit samples" do
    setup [:create_samples]

    test "renders form for editing chosen samples", %{conn: conn, samples: samples} do
      conn = get conn, litering_samples_path(conn, :edit, samples)
      assert html_response(conn, 200) =~ "Edit Samples"
    end
  end

  describe "update samples" do
    setup [:create_samples]

    test "redirects when data is valid", %{conn: conn, samples: samples} do
      conn = put conn, litering_samples_path(conn, :update, samples), samples: @update_attrs
      assert redirected_to(conn) == litering_samples_path(conn, :show, samples)

      conn = get conn, litering_samples_path(conn, :show, samples)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, samples: samples} do
      conn = put conn, litering_samples_path(conn, :update, samples), samples: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Samples"
    end
  end

  describe "delete samples" do
    setup [:create_samples]

    test "deletes chosen samples", %{conn: conn, samples: samples} do
      conn = delete conn, litering_samples_path(conn, :delete, samples)
      assert redirected_to(conn) == litering_samples_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, litering_samples_path(conn, :show, samples)
      end
    end
  end

  defp create_samples(_) do
    samples = fixture(:samples)
    {:ok, samples: samples}
  end
end
