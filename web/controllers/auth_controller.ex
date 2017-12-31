defmodule Talk.AuthController do
  use Talk.Web, :controller
  plug Ueberauth

  alias Talk.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    [first_name, last_name] = String.split(auth.info.name, " ")
    user_params = %{uid: auth.uid, token: auth.credentials.token, email: auth.info.email, gender: auth.extra.raw_info.user["gender"], fb_image_url: auth.info.image, provider: params["provider"], first_name: first_name, last_name: last_name, full_name: auth.info.name}

    changeset = User.changeset(%User{}, user_params)

    signin(conn, changeset)
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, uid: changeset.changes.uid) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end

  defp signin(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome Back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: login_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error Signing In")
        |> redirect(to: login_path(conn, :index))
    end
  end

  def signout(conn, _params) do
    conn
      |> configure_session(drop: true)
      |> put_flash(:info, "You've Successfully Signed Out")
      |> redirect(to: login_path(conn, :index))
  end

end
