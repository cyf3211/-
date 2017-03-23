class MovieGroupsController < ApplicationController
  def index
    @movie_groups = MovieGroup.all
  end

  def show
    @movie_group = MovieGroup.find(params[:id])
  end

  def new
    @movie_group = MovieGroup.new
  end

  def create
    @movie_group = MovieGroup.new(movie_group_params)
    @movie_group.save
    redirect_to movie_groups_path
  end

  def edit
    @movie_group = MovieGroup.find(params[:id])
  end

  def update
    @movie_group = MovieGroup.find(params[:id])
    @movie_group.update(movie_group_params)
    redirect_to movie_groups_path, notice: "更新成功！"
  end

  def destroy
    @movie_group = MovieGroup.find(params[:id])
    @movie_group.destroy
    flash[:alert] = "删除成功！"
    redirect_to movie_groups_path
  end
  private

  def movie_group_params
    params.require(:movie_group).permit(:title, :description)
  end
end
