defmodule Talk.QuestionTest do
  use Talk.ModelCase

  alias Talk.Question

  @valid_attrs %{content: "some content", timestamps: "some timestamps"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Question.changeset(%Question{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Question.changeset(%Question{}, @invalid_attrs)
    refute changeset.valid?
  end
end
