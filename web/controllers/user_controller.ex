defmodule Talk.UserController do
  use Talk.Web, :controller

  alias Talk.User
  alias Talk.Repo

  plug Talk.Plugs.RequireAuth

  def show(conn, _params) do
    if id = conn.assigns.user.id do
      user = Repo.get!(User, id)
      render conn, "show.html", user: user
    else
      conn
      |> put_flash(:error, "That's not your page")
      |> redirect(to: login_path(conn, :index))
    end
  end
end
