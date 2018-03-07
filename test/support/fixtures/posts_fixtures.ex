defmodule Blog.PostsFixtures do
  import Blog.FixtureHelpers

  def post_valid_attrs(), do: %{title: "test post", body: "this is a test post.", published: true}
  def post_invalid_attrs(), do: %{title: nil}

  def post_fixture(attrs \\ %{}) do
    random = gen_random_string() 
    valid_attrs = 
      post_valid_attrs()
      |> Enum.map(fn
          {:published, v} -> {:published, v}
          {k, v} -> {k, v <> " #{random}"} 
        end)
      |> Enum.into(%{})

    {:ok, user} =
      attrs
      |> Enum.into(valid_attrs)
      |> Blog.Posts.create_post()

    user
  end
  
  def gen_post_fixtures(num) when is_integer(num) do
    Enum.map(1..num, fn _n -> post_fixture() end)
  end
  def gen_post_fixtures(attrs_list) do
    Enum.map(attrs_list, fn attrs -> post_fixture(attrs) end)
  end
end