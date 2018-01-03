# defmodule Talk.CommentsChannel do
#   use Talk.Web, :channel
#   alias Talk.{UserResponse, Question}
#
#   def join("questions:" <> user_id, _params, socket) do
#     user_id = String.to_integer(user_id)
#     require IEx
#     IEx.pry()
#   end
#
#   def handle_in(name, %{"user_response" => %{"answer" => value, "question" => question_id}}, socket) do
#
#     question = Repo.get(Question, question_id)
#     changeset = question
#     |> build_assoc(:user_responses, user_id: user_id)
#     |> UserResponse.changeset(%{answer: value})
#     case Repo.insert(changeset) do
#       {:ok, _user_response} ->
#         conn
#         |> redirect(to: user_path(conn, :show, conn.assigns.user))
#       {:error, changeset} ->
#         render conn, "show.html", changeset: changeset
#     end
#         # case Repo.insert(changeset) do
#         #   {:ok, comment} ->
#         #     broadcast!(socket, "questions:#{socket.assigns.user.id}:new",
#         #     %{comment: comment}
#         #     )
#         #     {:reply, :ok, socket}
#         #     {:error, _reason} ->
#         #       {:reply, {:error, %{errors: changeset}}, socket}
#         #     end
#   end
# end
