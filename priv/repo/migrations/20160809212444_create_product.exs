defmodule Wholesail.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string, null: false
      add :description, :text
      add :price, :decimal, precision: 12, scale: 2, null: false

      timestamps()
    end

  end
end
