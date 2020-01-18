defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  def new(conn, param) do
    IO.puts('++++++')
    IO.inspect(conn)
    IO.puts('++++++')
    IO.inspect(param)
  end
end
