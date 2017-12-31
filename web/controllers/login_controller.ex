defmodule Talk.LoginController do
  use Talk.Web, :controller

  def index(conn, _params) do
    if conn.assigns.user do
      conn
      |> redirect(to: user_path(conn, :show, conn.assigns.user.id))
    else
      render conn, "index.html"
    end

  end
end
