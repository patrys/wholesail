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
shirts = %Wholesail.Category{}
|> Wholesail.Category.changeset(%{name: "Shirts"})
|> Wholesail.Repo.insert!

shirt = %Wholesail.Product{}
|> Wholesail.Product.changeset(%{name: "Shirt", description: "A shirt.", price: "12.45"})
|> Ecto.Changeset.put_assoc(:category, shirts)
|> Ecto.Changeset.put_assoc(:variants, [%{sku: "1234567890123"}])
|> Wholesail.Repo.insert!
