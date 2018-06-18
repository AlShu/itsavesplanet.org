defmodule ITSP.LiteringTest do
  use ITSP.DataCase

  alias ITSP.Litering

  describe "literings" do
    alias ITSP.Litering.Samples

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def samples_fixture(attrs \\ %{}) do
      {:ok, samples} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Litering.create_samples()

      samples
    end

    test "list_literings/0 returns all literings" do
      samples = samples_fixture()
      assert Litering.list_literings() == [samples]
    end

    test "get_samples!/1 returns the samples with given id" do
      samples = samples_fixture()
      assert Litering.get_samples!(samples.id) == samples
    end

    test "create_samples/1 with valid data creates a samples" do
      assert {:ok, %Samples{} = samples} = Litering.create_samples(@valid_attrs)
    end

    test "create_samples/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Litering.create_samples(@invalid_attrs)
    end

    test "update_samples/2 with valid data updates the samples" do
      samples = samples_fixture()
      assert {:ok, samples} = Litering.update_samples(samples, @update_attrs)
      assert %Samples{} = samples
    end

    test "update_samples/2 with invalid data returns error changeset" do
      samples = samples_fixture()
      assert {:error, %Ecto.Changeset{}} = Litering.update_samples(samples, @invalid_attrs)
      assert samples == Litering.get_samples!(samples.id)
    end

    test "delete_samples/1 deletes the samples" do
      samples = samples_fixture()
      assert {:ok, %Samples{}} = Litering.delete_samples(samples)
      assert_raise Ecto.NoResultsError, fn -> Litering.get_samples!(samples.id) end
    end

    test "change_samples/1 returns a samples changeset" do
      samples = samples_fixture()
      assert %Ecto.Changeset{} = Litering.change_samples(samples)
    end
  end
end
