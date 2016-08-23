defmodule Wholesail.ProductVariant do
  use Wholesail.Web, :model

  schema "product_variants" do
    field :sku, :string
    field :name, :string
    field :price_override, :decimal, precision: 12, scale: 2
    belongs_to :product, Wholesail.Product

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:sku, :name, :price_override])
    |> validate_required([:sku, :name, :price_override])
  end
end
