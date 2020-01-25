defmodule Discuss.TopicController do
  use Discuss.Web, :controller
  alias Discuss.Topic

  def new(conn, param) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html")
  end
end
