defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug(Ueberauth)
  alias Discuss.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    IO.inspect(auth)
    user_param = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}
    changeSet = User.changeset(%User{}, user_param)
    insert_or_update_user(changeSet)
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil -> Repo.insert(changeset)
      user -> {:ok, user}
    end
  end
end
