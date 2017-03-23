module MovieGroupsHelper
  def render_movie_group_description(movie_group)
    simple_format(movie_group.description)
  end
end
