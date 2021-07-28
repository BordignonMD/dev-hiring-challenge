defmodule Backend.Repositories.Create do
  alias Backend.{Repo, Repository}

  def call(params) do
    params
    |> Repository.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Repository{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
