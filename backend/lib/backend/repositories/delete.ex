defmodule Backend.Repositories.Delete do
  alias Backend.{Repo, Repository}

  def call(%Repository{} = repository) do
    repository
    |> Repo.delete()
    |> handle_delete()
  end

  defp handle_delete({:ok, %Repository{}} = result), do: result
  defp handle_delete({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
