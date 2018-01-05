defmodule Talk.UserController do
  use Talk.Web, :controller

  alias Talk.User
  alias Talk.Repo
  alias Talk.UserResponse

  plug Talk.Plugs.RequireAuth

  def show(conn, _params) do
    if id = conn.assigns.user.id do
      user = Repo.get!(User, id)
      match_query = from u in Talk.User, where: u.id != ^id
      random_query = from q in Talk.Question, order_by: fragment("RANDOM()"), limit: 1
      changeset = UserResponse.changeset(%UserResponse{})
      matches = #Repo.all(match_query)
        Talk.QueryHelper.find_matches(conn)
      [question] = Repo.all(random_query)
      render conn, "show.html", user: user, question: question, changeset: changeset, matches: matches
    else
      conn
      |> put_flash(:error, "That's not your page")
      |> redirect(to: login_path(conn, :index))
    end
  end
end
