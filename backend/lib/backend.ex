defmodule Backend do
  alias Backend.Repositories.Create,     as: RepositoryCreate
  alias Backend.Repositories.Delete,     as: RepositoryDelete
  alias Backend.Repositories.Index,      as: RepositoryIndex

  alias Backend.Utils.ServiceGitHub, as: ServiceGitHub

  defdelegate create_repository(params),              to: RepositoryCreate, as: :call
  defdelegate delete_repository(repository),          to: RepositoryDelete, as: :call
  defdelegate index_repository(language_search),      to: RepositoryIndex,  as: :call
  defdelegate index_repository(),                     to: RepositoryIndex,  as: :call

  defdelegate call_github(language_search), to: ServiceGitHub, as: :call
end
