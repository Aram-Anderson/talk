defmodule Talk.Router do
  use Talk.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Talk.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Talk do
    pipe_through :browser # Use the default browser stack

    get "/", LoginController, :index
  end

  scope "/users", Talk do
    pipe_through :browser

    get "/:id", UserController, :show
  end

  scope "/login", Talk do
    pipe_through :browser

    get "/", LoginController, :index
  end

  scope "/auth", Talk do
    pipe_through :browser

    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  scope "/about", Talk do
    pipe_through :browser

    get "/", AboutController, :index
  end

  scope "/user_response", Talk do
    pipe_through :browser

    post "/", UserResponseController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Talk do
  #   pipe_through :api
  # end
end
