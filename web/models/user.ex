defmodule Talk.User do
  use Talk.Web, :model

  schema "users" do
    has_many :user_responses, Talk.UserResponse
    field :uid, :string
    field :token, :string
    field :email, :string
    field :gender, :string
    field :fb_image_url, :string
    field :image_url, :string
    field :provider, :string
    field :first_name, :string
    field :last_name, :string
    field :full_name, :string
    field :bio, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
     struct
     |> cast(params, [:uid, :token, :email, :gender, :fb_image_url, :image_url, :provider, :first_name, :last_name, :full_name, :bio])
     |> validate_required([:uid, :token, :email, :fb_image_url, :provider, :first_name, :last_name, :full_name])
   end

end
