defmodule Talk.UserController do
  use Talk.Web, :controller

  alias Talk.User
  alias Talk.Repo
  alias Talk.UserResponse

  plug Talk.Plugs.RequireAuth

  def show(conn, _params) do
    if id = conn.assigns.user.id do
      user = Repo.get!(User, id)
      query = from u in Talk.User, where: u.id != ^id
      changeset = UserResponse.changeset(%UserResponse{})
      matches = Repo.all(query)
      [question] = Repo.all(from q in Talk.Question, order_by: fragment("RANDOM()"), limit: 1)
      render conn, "show.html", user: user, question: question, changeset: changeset, matches: matches
    else
      conn
      |> put_flash(:error, "That's not your page")
      |> redirect(to: login_path(conn, :index))
    end
  end
end
