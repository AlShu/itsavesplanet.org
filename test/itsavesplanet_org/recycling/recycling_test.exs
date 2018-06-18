defmodule ITSP.RecyclingTest do
  use ITSP.DataCase

  alias ITSP.Recycling

  describe "recyclings" do
    alias ITSP.Recycling.Samples

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def samples_fixture(attrs \\ %{}) do
      {:ok, samples} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recycling.create_samples()

      samples
    end

    test "list_recyclings/0 returns all recyclings" do
      samples = samples_fixture()
      assert Recycling.list_recyclings() == [samples]
    end

    test "get_samples!/1 returns the samples with given id" do
      samples = samples_fixture()
      assert Recycling.get_samples!(samples.id) == samples
    end

    test "create_samples/1 with valid data creates a samples" do
      assert {:ok, %Samples{} = samples} = Recycling.create_samples(@valid_attrs)
    end

    test "create_samples/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recycling.create_samples(@invalid_attrs)
    end

    test "update_samples/2 with valid data updates the samples" do
      samples = samples_fixture()
      assert {:ok, samples} = Recycling.update_samples(samples, @update_attrs)
      assert %Samples{} = samples
    end

    test "update_samples/2 with invalid data returns error changeset" do
      samples = samples_fixture()
      assert {:error, %Ecto.Changeset{}} = Recycling.update_samples(samples, @invalid_attrs)
      assert samples == Recycling.get_samples!(samples.id)
    end

    test "delete_samples/1 deletes the samples" do
      samples = samples_fixture()
      assert {:ok, %Samples{}} = Recycling.delete_samples(samples)
      assert_raise Ecto.NoResultsError, fn -> Recycling.get_samples!(samples.id) end
    end

    test "change_samples/1 returns a samples changeset" do
      samples = samples_fixture()
      assert %Ecto.Changeset{} = Recycling.change_samples(samples)
    end
  end
end
