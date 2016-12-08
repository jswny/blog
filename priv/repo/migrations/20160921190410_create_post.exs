defmodule PhoenixBlog.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :published, :boolean

      timestamps()
    end

  end
end
