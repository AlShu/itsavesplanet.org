defmodule ITSPWeb.Router do
  use ITSPWeb, :router

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

  scope "/", ITSPWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    scope "/litering", as: :litering do
      resources "/samples", Litering.SamplesController
    end
    scope "/recycling", as: :recycling do
      resources "/samples", Recycling.SamplesController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", ITSPWeb do
  #   pipe_through :api
  # end
end
