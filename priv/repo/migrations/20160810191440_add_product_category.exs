defmodule Wholesail.Repo.Migrations.AddProductCategory do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :category_id, references(:categories), null: false
    end
  end
end
