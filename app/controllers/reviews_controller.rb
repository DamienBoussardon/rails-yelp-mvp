class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  # def show
  #   @review = Review.find(params[:id])
  # end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
      render :new
    end
  end

  # def edit
  #   @review = Review.find(params[:id])
  # end

  # def update
  #   @review = Review.find(params[:id])
  # end

  # def destroy
  #   @review = Review.find(params[:id])
  # end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
