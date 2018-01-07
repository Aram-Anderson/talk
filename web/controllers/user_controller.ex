defmodule Talk.UserController do
  use Talk.Web, :controller

  alias Talk.User
  alias Talk.Repo
  alias Talk.UserResponse

  plug Talk.Plugs.RequireAuth

  def show(conn, _params) do
    if id = conn.assigns.user.id do
      user = Repo.get!(User, id)
      random_query = from q in Talk.Question, order_by: fragment("RANDOM()"), limit: 1
      changeset = UserResponse.changeset(%UserResponse{})
      matches = Talk.QueryHelper.find_matches(conn)
      [question] = Repo.all(random_query)
      render conn, "show.html", user: user, question: question, changeset: changeset, matches: matches
    else
      conn
      |> put_flash(:error, "That's not your page")
      |> redirect(to: login_path(conn, :index))
    end
  end

  def edit(conn, %{"id" => user_id}) do
  user = Repo.get(User, user_id)
  changeset = User.changeset(user)

  render conn, "edit.html", changeset: changeset, user: user
end

def update(conn, %{"id" => user_id, "user" => user}) do
  old_user = Repo.get(User, user_id)
  changeset = User.changeset(old_user, user)

  case Repo.update(changeset) do
    {:ok, _user} ->
      conn
      |> put_flash(:info, "Profile Updated")
      |> redirect(to: user_path(conn, :show, conn.assigns.user.id))
    {:error, changeset} ->
      render conn, "edit.html", changeset: changeset, user: old_user
  end
end
end
