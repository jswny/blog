defmodule Blog.UserTest do
  use Blog.ModelCase, async: true
  alias Blog.User

  @valid_attrs %{name: "John Doe", username: "test", password: "secret"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "registration_changeset with valid attributes hashes passowrd" do
    attrs = Map.put(@valid_attrs, :password, "123456")
    changeset = User.registration_changeset(%User{}, attrs)
    %{password: pass, password_hash: pass_hash} = changeset.changes
    assert changeset.valid?
    assert pass_hash
    assert pass != pass_hash
    assert Comeonin.Bcrypt.checkpw(pass, pass_hash)
  end
end
