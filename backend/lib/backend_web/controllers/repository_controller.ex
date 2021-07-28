defmodule BackendWeb.RepositoryController do
  use BackendWeb, :controller

  alias BackendWeb.FallbackController

  action_fallback FallbackController

  def index(conn, %{"language" => language_search}) do
    with {:ok, repositories: repositories} <- Backend.index_repository(language_search) do
      conn
      |> put_status(:ok)
      |> render("index.json", repositories: repositories)
    end
  end

  def index(conn, _params) do
    with {:ok, repositories: repositories} <- Backend.index_repository() do
      conn
      |> put_status(:ok)
      |> render("index.json", repositories: repositories)
    end
  end
end
