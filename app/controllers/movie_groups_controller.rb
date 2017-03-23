class MovieGroupsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy, :favorite, :unfavorite]
  before_action :find_movie_group_and_check_permission, only: [:edit, :update, :destroy]
  def index
    @movie_groups = MovieGroup.all
  end

  def show
    @movie_group = MovieGroup.find(params[:id])
    @reviews = @movie_group.reviews.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @movie_group = MovieGroup.new
  end

  def create
    @movie_group = MovieGroup.new(movie_group_params)
    @movie_group.user = current_user
    if @movie_group.save
      current_user.favorite!(@movie_group)
      redirect_to movie_groups_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @movie_group.update(movie_group_params)
      redirect_to movie_groups_path, notice: "更新成功！"
    else
      render :edit
    end
  end

  def destroy
    @movie_group.destroy
    redirect_to movie_groups_path, alert: "删除成功！"
  end

  def favorite
    @movie_group = MovieGroup.find(params[:id])
    if !current_user.favorite?(@movie_group)
      current_user.favorite!(@movie_group)
      flash[:notice] = "收藏成功！"
    else
      flash[:warning] = "你已经收藏过了！"
    end
    redirect_to movie_group_path(@movie_group)
  end

  def unfavorite
    @movie_group = MovieGroup.find(params[:id])
    if current_user.favorite?(@movie_group)
      current_user.unfavorite!(@movie_group)
      flash[:alert] = "已取消收藏！"
    else
      flash[:warning] = "还未收藏"
    end
    redirect_to movie_group_path(@movie_group)
  end

  private

  def movie_group_params
    params.require(:movie_group).permit(:title, :description)
  end

  def find_movie_group_and_check_permission
    @movie_group = MovieGroup.find(params[:id])
    if current_user != @movie_group.user
    redirect_to root_path, alert: "对不起，你没有权限"
    end
  end

end
