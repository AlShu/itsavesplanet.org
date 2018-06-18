defmodule ITSP.LiteringsTest do
  use ITSP.DataCase

  alias ITSP.Literings

  describe "literings" do
    alias ITSP.Literings.Litering

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def litering_fixture(attrs \\ %{}) do
      {:ok, litering} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Literings.create_litering()

      litering
    end

    test "list_literings/0 returns all literings" do
      litering = litering_fixture()
      assert Literings.list_literings() == [litering]
    end

    test "get_litering!/1 returns the litering with given id" do
      litering = litering_fixture()
      assert Literings.get_litering!(litering.id) == litering
    end

    test "create_litering/1 with valid data creates a litering" do
      assert {:ok, %Litering{} = litering} = Literings.create_litering(@valid_attrs)
    end

    test "create_litering/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Literings.create_litering(@invalid_attrs)
    end

    test "update_litering/2 with valid data updates the litering" do
      litering = litering_fixture()
      assert {:ok, litering} = Literings.update_litering(litering, @update_attrs)
      assert %Litering{} = litering
    end

    test "update_litering/2 with invalid data returns error changeset" do
      litering = litering_fixture()
      assert {:error, %Ecto.Changeset{}} = Literings.update_litering(litering, @invalid_attrs)
      assert litering == Literings.get_litering!(litering.id)
    end

    test "delete_litering/1 deletes the litering" do
      litering = litering_fixture()
      assert {:ok, %Litering{}} = Literings.delete_litering(litering)
      assert_raise Ecto.NoResultsError, fn -> Literings.get_litering!(litering.id) end
    end

    test "change_litering/1 returns a litering changeset" do
      litering = litering_fixture()
      assert %Ecto.Changeset{} = Literings.change_litering(litering)
    end
  end
end
