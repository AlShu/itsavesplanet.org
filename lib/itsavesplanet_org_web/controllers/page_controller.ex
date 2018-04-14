defmodule ITSPWeb.PageController do
  use ITSPWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
