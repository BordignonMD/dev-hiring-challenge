defmodule Backend.Repositories.Index do
  import Ecto.Query

  alias Backend.{Repo, Repository}

  # when informed language, uses GitHub API to search highlighted repositories
  def call(language) do
    # Call the api GitHub
    repositories = Backend.call_github(language)
    |> Enum.map(fn
      %{
        "id" => repository_id,
        "name" => name,
        "description" => description,
        "language" => language,
        "stargazers_count" => stars,
        "html_url" => url,
        "updated_at" => last_update}
        ->
          insert_repository(
            %{
              id: repository_id,
              name: name,
              description: description,
              language: language,
              stars: stars,
              url: url,
              last_update: last_update}) end)

    {:ok, repositories: repositories}
  end

  # when no language is informed, search the database for the highlighted repositories
  def call() do
    repositories = from(repository in Repository, order_by: [desc: repository.stars], limit: 10)
    |> Repo.all()

    {:ok, repositories: repositories}
  end

  # Insert Repositories
  defp insert_repository(%{id: repository_id, name: name, description: description, stars: stars, language: language, url: url, last_update: last_update} = repository) do
    case Repo.get(Repository, repository_id) do
      nil -> nil
      repository -> Backend.delete_repository(repository)
    end

    Backend.create_repository(%{id: repository_id, name: name, description: description, stars: stars, language: language, url: url, last_update: last_update})

    repository
  end
end
