defmodule BackendWeb.RepositoryView do
  use BackendWeb, :view

  def render("index.json", %{repositories: repositories}) do
    %{data: render_many(repositories, __MODULE__, "repository.json", as: :repository)}
  end

  def render("repository.json", %{repository: repository}) do
    %{
      id: repository.id,
      name: repository.name,
      description: repository.description,
      language: repository.language,
      stars: repository.stars,
      url: repository.url,
      last_update: repository.last_update
    }
  end
end
