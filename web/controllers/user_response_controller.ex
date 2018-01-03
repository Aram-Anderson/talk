defmodule Talk.UserResponseController do
  use Talk.Web, :controller

  alias Talk.Question
  alias Talk.UserResponse

  def create(conn, %{"user_response" => %{"answer" => value, "question" => question_id}}) do
    question = Repo.get(Question, question_id)
    user_id = conn.assigns.user.id
    changeset = question
    |> build_assoc(:user_responses, user_id: user_id)
    |> UserResponse.changeset(%{answer: value})

    case Repo.insert(changeset) do
    {:ok, _user_response} ->
      conn
      |> redirect(to: user_path(conn, :show, conn.assigns.user))
    {:error, changeset} ->
        render conn, "show.html", changeset: changeset
  end

  end

end
