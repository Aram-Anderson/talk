defmodule Talk.Repo.Migrations.CreateUserResponse do
  use Ecto.Migration

  def change do
    create table(:user_responses) do
      add :answer, :integer
      add :question_id, references(:questions, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:user_responses, [:question_id])
    create index(:user_responses, [:user_id])
  end
end
