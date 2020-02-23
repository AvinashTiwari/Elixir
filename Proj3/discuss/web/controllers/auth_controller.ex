defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug(Ueberauth)

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    IO.inspect(auth)
  end
end
