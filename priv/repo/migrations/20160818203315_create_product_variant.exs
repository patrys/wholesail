defmodule Wholesail.Repo.Migrations.CreateProductVariant do
  use Ecto.Migration

  def change do
    create table(:product_variants) do
      add :sku, :string, null: false
      add :name, :string
      add :price_override, :decimal, precision: 12, scale: 2
      add :product_id, references(:products, on_delete: :nothing), null: false

      timestamps()
    end
    create index(:product_variants, [:product_id])

  end
end
