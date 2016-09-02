defmodule Wholesail.Router do
  use Wholesail.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :storefront do
    plug :fetch_cart
    plug :fetch_root_categories
  end

  defp fetch_cart(conn, _) do
    assign conn, :cart_count, 0
  end

  defp fetch_root_categories(conn, _) do
    categories = Wholesail.Repo.all Wholesail.Category.root_categories
    assign conn, :root_categories, categories
  end

  scope "/", Wholesail do
    pipe_through [:browser, :storefront]

    get "/", PageController, :index
    resources "/categories", CategoryController, only: [:index, :show]
    resources "/products", ProductController, only: [:show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Wholesail do
  #   pipe_through :api
  # end
end
