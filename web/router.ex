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
  end

  defp fetch_cart(conn, _) do
    conn
    |> assign(:cart_count, 0)
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
