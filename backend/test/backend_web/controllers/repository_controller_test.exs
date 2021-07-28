defmodule BackendWeb.RepositoryControllerTest do
  use BackendWeb.ConnCase

  alias Backend
  alias Backend.Repository

  describe "index/2" do
    test "when given a valid language, returns the list of the 10 repositories with the most stars.", %{conn: conn} do
      response =
        conn
        |> get(Routes.repository_path(conn, :index, language: "Elixir"))
        |> json_response(:ok)

      %{"data" => data} = response

      assert %{"data" => _data} = response
      assert length(data) === 10
    end

    test "when given an invalid language, returns the empty list.", %{conn: conn} do
      response =
        conn
        |> get(Routes.repository_path(conn, :index, language: "abcdefg"))
        |> json_response(:ok)

        %{"data" => data} = response

        assert %{"data" => _data} = response
        assert length(data) === 0
    end

    test "when not informed a language, returns the list of the 10 repositories with the most stars in the history.", %{conn: conn} do
      conn
      |> get(Routes.repository_path(conn, :index, language: "Elixir"))

      response =
        conn
        |> get(Routes.repository_path(conn, :index))
        |> json_response(:ok)

      %{"data" => data} = response

      assert %{"data" => _data} = response
      assert length(data) === 10
    end
  end
end
