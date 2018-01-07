defmodule Talk.QueryHelper do
  import Ecto.Query

  alias Talk.{Repo, UserResponse, User}

  def find_matches(conn) do
    user =  conn.assigns.user
    |> Repo.preload([:user_responses])

    other_users = Repo.all(from u in Talk.User, where: u.id != ^user.id)
    |> Repo.preload([:user_responses])

    current_user_answer_map =
      for responses <- user.user_responses, into: %{}, do: {responses.question_id, responses.answer}

    current_user_responses = %{user_id: user.id, answers: current_user_answer_map}

    other_users_responses = for match <- other_users, into: %{}, do: {match.id,
      Enum.reduce(match.user_responses, 0, fn(response, acc) ->
        case Map.has_key?(current_user_responses.answers, response.question_id) do
          true ->
            acc + (current_user_responses.answers[response.question_id] - response.answer)
          false ->
            acc
          end
      end)
      }

    sorted_matches = Enum.map(other_users_responses, fn({key, value}) -> {String.to_atom(Integer.to_string(key)), value} end) |> List.keysort(1)
    require IEx
    IEx.pry()

    [match_profiles | _tail] = Enum.split(sorted_matches, 3) |> Tuple.to_list()

    match_ids =
      match_profiles
        |> Keyword.keys()
        |> Enum.map(fn(id) ->
          Atom.to_string(id)
          |> String.to_integer()
        end)

    User |> where([u], u.id in ^match_ids) |> Repo.all
  end

end
