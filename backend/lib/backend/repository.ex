defmodule Backend.Repository do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, autogenerate: false}
  @required_params [:id, :name, :description, :language, :stars, :url, :last_update]

  @derive {Jason.Encoder, only: @required_params}

  schema "repositories" do
    field :name, :string
    field :description, :string
    field :language, :string
    field :stars, :integer
    field :url, :string
    field :last_update, :string

    timestamps()
  end

  def changeset(repository \\ %__MODULE__{}, params) do
    repository
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 1)
    |> validate_length(:description, min: 1)
    |> validate_length(:url, min: 3)
    |> validate_length(:language, min: 1)
  end
end
