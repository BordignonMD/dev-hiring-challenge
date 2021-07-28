defmodule Backend.Utils.ServiceGitHub do

  # Number of results retrieved from GitHub
  @nPage 10

  def call(language_search) do
    {:ok, response} = HTTPoison.get("https://api.github.com/search/repositories?q=language:" <> language_search <> "&sort=stars&order_by=desc&per_page=#{@nPage}")

    %{body: body} = response

    Poison.decode!(body)
    |> return_api()
  end

  defp return_api(%{"message" => _message, "errors" => _errors, "documentation_url" => _documentation_url}), do: []
  defp return_api(%{"total_count" => _total_count, "incomplete_results" => _incomplete_results, "items" => items}), do: items
end
