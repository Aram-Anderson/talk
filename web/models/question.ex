defmodule Talk.Question do
  use Talk.Web, :model

  @derive {Poison.Encoder, only: [:content, :id]}

  schema "questions" do
    has_many :user_responses, Talk.UserResponse
    field :content, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
