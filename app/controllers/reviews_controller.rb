class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  before_action :find_movie_group_and_check_review_permission, only: [:new, :create,:edit,:update,:destroy]
def new
  @review = Review.new
end

def create
  @review = Review.new(review_params)
  @review.movie_group = @movie_group
  @review.user = current_user

  if @review.save
    redirect_to movie_group_path(@movie_group)
  else
    render :new
  end
end

def edit
  @review = Review.find(params[:id])
end

def update
  @review = Review.find(params[:id])
  if @review.update(review_params)
    redirect_to account_reviews_path, notice: "更新成功！"
  else
    render :edit
  end
end

def destroy
  @review = Review.find(params[:id])
  @review.destroy
  redirect_to account_reviews_path, alert: "删除成功！"
end


private

def review_params
  params.require(:review).permit(:content)
end

def find_movie_group_and_check_review_permission
  @movie_group = MovieGroup.find(params[:movie_group_id])
  if !current_user.favorite?(@movie_group)
  redirect_to movie_group_path(@movie_group), alert: "请先收藏本片再评论"
  end
end

end
