defmodule Talk.AboutController do
  use Talk.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
