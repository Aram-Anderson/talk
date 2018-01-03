defmodule Talk.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :content, :string

      timestamps()
    end
  end
end
