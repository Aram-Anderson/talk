defmodule Talk.QueryHelper do
  import Ecto.Query

  alias Talk.{Repo, UserResponse, User}

  def find_matches(conn) do
    user =  conn.assigns.user
    |> Repo.preload([:user_responses])

    other_users = Repo.all(from u in Talk.User, where: u.id != ^user.id)
    |> Repo.preload([:user_responses])

    current_user_answer_map = Enum.reduce(user.user_responses, %{}, fn(x), acc -> Map.put(acc, x.question_id, x.answer) end)

    current_user_responses = %{user_id: user.id, answers: current_user_answer_map}

    require IEx
    IEx.pry()
    # Enum.each(user.user_responses, fn(user_response) ->
    #   Map.put(current_user_responses, user_response.question_id, user_response.answer)
    # end)

  end

end
