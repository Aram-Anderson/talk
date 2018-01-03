defmodule Talk.UserResponseTest do
  use Talk.ModelCase

  alias Talk.UserResponse

  @valid_attrs %{answer: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = UserResponse.changeset(%UserResponse{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = UserResponse.changeset(%UserResponse{}, @invalid_attrs)
    refute changeset.valid?
  end
end
