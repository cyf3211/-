class Account::MovieGroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @movie_groups = current_user.participated_movie_groups
  end
  
end
