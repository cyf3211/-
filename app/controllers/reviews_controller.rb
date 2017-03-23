class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

def new
  @movie_group = MovieGroup.find(params[:movie_group_id])
  @review = Review.new
end

def create
  @movie_group = MovieGroup.find(params[:movie_group_id])
  @review = Review.new(review_params)
  @review.movie_group = @movie_group
  @review.user = current_user

  if @review.save
    redirect_to movie_group_path(@movie_group)
  else
    render :new
  end
end


private

def review_params
  params.require(:review).permit(:content)
end

end
