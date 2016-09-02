defmodule Wholesail.CategoryController do
  use Wholesail.Web, :controller

  alias Wholesail.Category
  alias Wholesail.Product
  alias Wholesail.Repo

  def index(conn, params) do
    categories = Repo.all Category

    render conn, :index, categories: categories
  end

  def show(conn, %{"id" => id} = params) do
    category = Repo.get! Category, id

    products = from p in Product,
      where: p.category_id == ^id,
      order_by: :name

    page_number = Map.get params, "page", 1
    page = Repo.paginate products,
      page: page_number,
      page_size: 12

    render conn, :show,
      category: category,
      page: page
  end
end
