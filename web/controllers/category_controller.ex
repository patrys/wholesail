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

    page = Repo.paginate products, params

    render conn, :show,
      category: category,
      products: page.entries,
      page_number: page.page_number,
      page_size: page.page_size,
      total_pages: page.total_pages,
      total_entries: page.total_entries
  end
end
