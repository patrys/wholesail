defmodule Wholesail.Product do
  use Wholesail.Web, :model

  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :decimal, precision: 12, scale: 2
    belongs_to :category, Wholesail.Category
    has_many :variants, Wholesail.ProductVariant

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :price])
    |> cast_assoc(:category)
    |> validate_required([:name, :description, :price])
  end
end
