class MovieGroupsController < ApplicationController
  def index
    @movie_groups = MovieGroup.all
  end
end
