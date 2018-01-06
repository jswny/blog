defmodule Blog.Posts do
  @moduledoc """
  This is the context which handles all post functionality.
  """

  import Ecto
  import Ecto.Query, warn: false
  alias Blog.Repo
  alias Blog.Post

  @doc """
  Gets a list of all published posts.

  ## Examples
  
      iex> list_published_posts()
      [%Post{..., pubished: true}, ...] 

  """
  def list_published_posts() do
    query =  
        from p in Post,
        where: p.published == true,
        order_by: [desc: p.inserted_at],
      select: p

    Repo.all(query)
  end

  @doc """
  Gets a list of all posts, published and unpublished.

  ## Examples
  
      iex> list_posts()
      [%Post{}, ...] 

  """
  def list_posts() do
    query = 
        from p in Post,
        order_by: [desc: p.inserted_at],
        select: p

    Repo.all(query)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the post does not exist.

  ## Examples

      iex> get_post_by_slug("abc123")
      %Post{}

      iex> get_post_by_slug("bad")
      ** (Ecto.NoResultsError)
  """
  def get_post_by_slug!(slug) do
    Post
    |> Repo.get_by!(slug: slug)
  end

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples
  
      iex> change_post(post)
      %Ecto.Changeset{source: %Post{}}
  """
  def change_post(%Post{} = post) do
    Post.changeset(post, %{})
  end
end
