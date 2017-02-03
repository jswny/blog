defmodule PostRepoTest do
  use PhoenixBlog.ModelCase
  alias PhoenixBlog.Post

  @valid_attrs %{title: "test post", body: "this is a test post.", published: true}

  test "converts unique_constraint on slug to error" do
    insert_post(%{title: "a cool post", body: "this is a cool post.", published: true})
    attrs = Map.put(@valid_attrs, :title, "a cool post")
    changeset = Post.changeset(%Post{}, attrs)
    assert {:error, changeset} = Repo.insert(changeset)
    assert {:slug, {"has already been taken", []}} in changeset.errors
  end
end