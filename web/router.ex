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

  scope "/", Wholesail do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/categories", CategoryController, only: [:index, :show]
    resources "/products", ProductController, only: [:show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Wholesail do
  #   pipe_through :api
  # end
end
