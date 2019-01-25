defmodule PracticeWeb.Router do
  use PracticeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    #plug MyAuth
    #plug :put_user_token
  end

  #def put_user_token(conn, _) do
   # if current_user = conn.assigns[:current_user] do
    #  token = Phoenix.Token.sign(conn, "user socket", current_user.id)
     # assign(conn, :user_token, token)
    #else
     # conn
    #end
  #end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PracticeWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/double", PageController, :double
    post "/calc", PageController, :calc
    post "/factor", PageController, :factor
    post "/palindrome", PageController, :palindrome
  end

  # Other scopes may use custom stacks.
   scope "/api", PracticeWeb do
     pipe_through :api
   end
end
