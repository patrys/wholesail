# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Wholesail.Repo.insert!(%Wholesail.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Faker.start

defmodule Wholesail.Seeds do
  alias Ecto.Changeset
  alias Wholesail.{Product, Repo}

  defp product_description do
    Enum.join(Faker.Lorem.paragraphs, "\n\n")
  end

  defp product_price do
    Float.to_string(Faker.Commerce.price)
  end

  defp add_product_variants(changeset) do
    changeset
    |> Changeset.put_assoc(:variants, [%{sku: "1234567890123"}])
  end

  def create_random_product(category) do
    data = %{
      name: Faker.Commerce.product_name,
      description: product_description,
      price: product_price
    }

    %Product{}
    |> Product.changeset(data)
    |> Changeset.put_assoc(:category, category)
    |> add_product_variants
    |> Repo.insert!
  end
end


category = %Wholesail.Category{}
|> Wholesail.Category.changeset(%{name: Faker.Company.buzzword})
|> Wholesail.Repo.insert!

1..40
|> Enum.each(fn _ -> Wholesail.Seeds.create_random_product category end)
