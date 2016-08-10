defmodule Wholesail.ProductController do
  use Wholesail.Web, :controller

  alias Wholesail.Product
  alias Wholesail.Repo

  def show(conn, %{"id" => id}) do
    products = from p in Product,
      preload: :category

    product = Repo.get!(products, id)

    render conn, :show, product: product
  end
end
