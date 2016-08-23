defmodule Wholesail.ProductVariantTest do
  use Wholesail.ModelCase

  alias Wholesail.ProductVariant

  @valid_attrs %{name: "some content", price_override: "120.5", sku: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ProductVariant.changeset(%ProductVariant{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ProductVariant.changeset(%ProductVariant{}, @invalid_attrs)
    refute changeset.valid?
  end
end
