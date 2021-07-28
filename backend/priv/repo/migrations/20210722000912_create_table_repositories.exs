defmodule Backend.Repo.Migrations.CreateTableRepositories do
  use Ecto.Migration

  def change do
    create table(:repositories, primary_key: false) do
      add :id, :integer, primary_key: true
      add :name, :text
      add :description, :text
      add :language, :text
      add :stars, :integer
      add :url, :text
      add :last_update, :string

      timestamps()
    end
  end
end
