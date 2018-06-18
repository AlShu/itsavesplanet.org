defmodule ITSPWeb.LiteringControllerTest do
  use ITSPWeb.ConnCase

  alias ITSP.Literings

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:litering) do
    {:ok, litering} = Literings.create_litering(@create_attrs)
    litering
  end

  describe "index" do
    test "lists all literings", %{conn: conn} do
      conn = get conn, litering_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Literings"
    end
  end

  describe "new litering" do
    test "renders form", %{conn: conn} do
      conn = get conn, litering_path(conn, :new)
      assert html_response(conn, 200) =~ "New Litering"
    end
  end

  describe "create litering" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, litering_path(conn, :create), litering: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == litering_path(conn, :show, id)

      conn = get conn, litering_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Litering"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, litering_path(conn, :create), litering: @invalid_attrs
      assert html_response(conn, 200) =~ "New Litering"
    end
  end

  describe "edit litering" do
    setup [:create_litering]

    test "renders form for editing chosen litering", %{conn: conn, litering: litering} do
      conn = get conn, litering_path(conn, :edit, litering)
      assert html_response(conn, 200) =~ "Edit Litering"
    end
  end

  describe "update litering" do
    setup [:create_litering]

    test "redirects when data is valid", %{conn: conn, litering: litering} do
      conn = put conn, litering_path(conn, :update, litering), litering: @update_attrs
      assert redirected_to(conn) == litering_path(conn, :show, litering)

      conn = get conn, litering_path(conn, :show, litering)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, litering: litering} do
      conn = put conn, litering_path(conn, :update, litering), litering: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Litering"
    end
  end

  describe "delete litering" do
    setup [:create_litering]

    test "deletes chosen litering", %{conn: conn, litering: litering} do
      conn = delete conn, litering_path(conn, :delete, litering)
      assert redirected_to(conn) == litering_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, litering_path(conn, :show, litering)
      end
    end
  end

  defp create_litering(_) do
    litering = fixture(:litering)
    {:ok, litering: litering}
  end
end
