defmodule Talk.UserResponse do
  use Talk.Web, :model

  schema "user_responses" do
    field :answer, :integer
    belongs_to :question, Talk.Question, foreign_key: :question_id
    belongs_to :user, Talk.User, foreign_key: :user_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:answer])
    |> validate_required([:answer])
  end
end
